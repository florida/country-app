class WorldController < ApplicationController
  def index
  	@country = Country.order('name')
  end

  def by_population
  	@country = Country.reorder('population DESC')
  end

  def by_age
  	@country = Country.order('median_age')
  end

  def by_required_service
  	@country = Country.where(:mandatory_military_service => true)

  end
end
