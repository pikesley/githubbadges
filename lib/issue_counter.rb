require 'sinatra/base'
require 'curb'
require 'json'

class IssueCounter < Sinatra::Base
  get '/' do
    'Try /:owner/:repo'
  end

  get '/:user/:repo' do
    c = Curl::Easy.new("https://api.github.com/repos/#{params[:user]}/#{params[:repo]}/issues")
    c.headers = {
        'Accept'     => 'application/json',
        'User-agent' => 'IssueCounter'
    }
    c.perform
    j = JSON.parse c.body_str
    count = j.count

    colour = case count
    when 0
      'brightgreen'
    when 1..3
      'blue'
    when 4..6
      'orange'
    else
      'red'
    end

    redirect "http://img.shields.io/badge/open%20issues-#{j.count}-#{colour}.svg"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
