require 'sinatra/base'
require 'curb'
require 'json'
require 'haml'
require 'kramdown'

GITHUB = {
  user:    'pikesley',
  project: 'githubbadges',
  ribbon:  'right_gray_6d6d6d'
}

class GithubBadges < Sinatra::Base
  attr_accessor :count

  get '/' do
    haml :index, locals: {
      title: 'Github Badges',
      github: GITHUB
    }  end

  get '/:user/:repo/:thing' do
    thing_parts = params[:thing].split('.')
    @thing = thing_parts[0...-1].join('.')
    @extension = thing_parts[-1]

    c = Curl::Easy.new("https://api.github.com/repos/#{params[:user]}/#{params[:repo]}/#{@thing}")
    c.headers = {
        'Accept'     => 'application/json',
        'User-agent' => 'GithubBadges'
    }
    c.perform
    j = JSON.parse c.body_str
    @count = j.count ||= 'NaN'
    bounce
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  def bounce
    redirect target
  end

  def target
    "http://img.shields.io/badge/#{label}-#{@count}-#{Badgerise.colour @count}.#{@extension}"
  end
end

module Badgerise
  def Badgerise.colour count
    case count
      when 0
        'brightgreen'
      when 1..3
        'blue'
      when 4..6
        'orange'
      else
        'red'
    end
  end

  def Badgerise.label source
    case source
      when 'issues'
        'open%20issues'
      when 'pulls'
        'pending%20pull--requests'
      else
        source
    end
  end

  def target label, count, extension = 'svg'
    "http://img.shields.io/badge/#{label}-#{@count}-#{Badgerise.colour @count}.#{@extension}"
  end
end
