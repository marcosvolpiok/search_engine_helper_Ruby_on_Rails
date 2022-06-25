class SearchController < ApplicationController
  require 'net/http'
  require 'uri'

  def search
    engine = params[:engine].upcase
    #content = Net::HTTP.get(URI.parse(''))
    #puts content
    config = {
      GOOGLE: {url: 'https://www.google.com/search?q='},
      BING: {url: 'https://www.bing.com/search?q='}
    }


    if engine == "GOOGLE" || engine == "BING"
      content = Net::HTTP.get(URI.parse("#{config[engine.to_sym][:url]}#{params[:q]}"))
      render :inline => content.force_encoding('iso-8859-1')
    elsif engine == "GOOGLEBING" || engine == "BINGGOOGLE"
      render :inline => "both"
    end
  end
 
end
