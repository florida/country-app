class WorldController < ApplicationController
  def index
  	@country = Country.order('name')
  end

  def by_population
  	@country = Country.reorder('population DESC')
  end

  def by_age
  	@country = Country.where('median_age > 30').order('median_age')
  end

  def by_required_service
  	@country = Country.where(:mandatory_military_service => true)
  end

  def search 
  	#loads up search.html.haml
  	@search_options = ["All Countries", "Countries with mandatory military service", "Countries without mandatory military service"]
  end

  def search_results
  	@keyword = params[:keyword]
  	session[:recent_search] = @keyword
    @selected_search_option = params[:mandatory_military_service]
    case @selected_search_option
    when "All Countries"
    	@country = Country.where("name LIKE ?", "%#{@keyword}%")
    when "Countries with mandatory military sevice"
    	@country = Country.where(:mandatory_military_service => true).where("name LIKE ?", "%#{@keyword}")
    when 
    	@country = Country.where(:mandatory_military_service => false).where("name LIKE ?", "%#{@keyword}")   
    end 

    if @country.empty?
    	flash[:error] = "Country doesn't exist"
    	redirect_to search_path
    end
  end
end
