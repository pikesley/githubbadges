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
    }
  end

  get '/:user/:repo/:thing/?' do
    c = Curl::Easy.new("https://api.github.com/repos/#{params[:user]}/#{params[:repo]}/#{Badgerise.without_extension params[:thing]}")
    c.headers = {
        'Accept'     => 'application/json',
        'User-agent' => 'GithubBadges'
    }
    c.perform
    j = JSON.parse c.body_str
    @count = j.count ||= 'NaN'

    bounce params[:style]
  end

  # start the server if ruby file executed directly
  run! if app_file == $0

  def bounce style = nil
    redirect Badgerise.target params[:thing], @count, style
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
    source = without_extension source
    case source
      when 'issues'
        'open%20issues'
      when 'pulls'
        'pending%20pull--requests'
      else
        source
    end
  end

  def Badgerise.get_extension text
    parts = text.split('.')
    if ['svg', 'png'].include? parts[-1]
      return parts[-1]
    end

    'svg'
  end

  def Badgerise.without_extension text
    parts = text.split('.')

    if ['svg', 'png'].include? parts[-1]
      return parts[0...-1].join('.')
    end

    text
  end

  def Badgerise.target type, count, style = nil
    u = "http://img.shields.io/badge/#{label type}-#{count}-#{Badgerise.colour count}.#{Badgerise.get_extension type}"
    u = "#{u}?style=#{style}" if style

    u
  end
end
