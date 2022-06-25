class SearchController < ApplicationController
  require 'net/http'
  require 'uri'

  def search
    engine = params[:engine].upcase
    config = {
      GOOGLE: {url: 'https://www.google.com/search?q='},
      BING: {url: 'https://www.bing.com/search?q='}
    }
    content = ""


    if engine == "GOOGLE" || engine == "BING"
      content = Net::HTTP.get(URI.parse("#{config[engine.to_sym][:url]}#{params[:q]}"))
      render :inline => content.force_encoding('iso-8859-1')
    elsif engine == "GOOGLEBING" || engine == "BINGGOOGLE"
      config.each do |c|
        content = content + Net::HTTP.get(URI.parse("#{c[1][:url]}#{params[:q]}"))
      end

      render :inline => content.force_encoding('iso-8859-1')
    end
  end
 
end
