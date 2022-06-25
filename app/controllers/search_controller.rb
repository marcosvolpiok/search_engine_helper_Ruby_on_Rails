class SearchController < ApplicationController
    def search
      puts "q:::::::::::::"+params[:q]
      puts params[:engine]
      

      engine = params[:engine].upcase
      if engine == "GOOGLE"
        render :inline => "searching in google"
      elsif engine == "BING"
        render :inline => "bing"
      elsif engine == "GOOGLEBING" || engine == "BINGGOOGLE"
        render :inline => "both"
      end
    end
 
end
