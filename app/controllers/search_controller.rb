class SearchController < ApplicationController
  require 'net/http'
  require 'uri'
  CONFIG = {
    GOOGLE: {url: 'https://www.google.com/search?q='},
    BING: {url: 'https://www.bing.com/search?q='}
  }


  def search
    engine = validate_engine(params[:engine])
    flag_q_not_defined = validate_q(params[:q])
    content = ""

    if (engine == "GOOGLE" || engine == "BING") && flag_q_not_defined == true
      content = get_url_content("#{CONFIG[engine.to_sym][:url]}#{params[:q]}")
      render_content(content)
    elsif (engine == "GOOGLEBING" || engine == "BINGGOOGLE") && flag_q_not_defined == true
      config.each do |c|
        content = content + get_url_content("#{c[1][:url]}#{params[:q]}")
      end

      render_content(content)
    else
      render_content('Undefined keyword')
    end
  end
 
  def get_url_content(url)
    Net::HTTP.get(URI.parse(url))
  end

  def render_content(content)
    render :inline => content.force_encoding('iso-8859-1')
  end

  def validate_engine(engine)
    unless engine.nil?
      engine = engine.upcase
    else
      engine = 'GOOGLEBING'
    end

    return engine
  end

  def validate_q(q)
    q.present
  end
end
