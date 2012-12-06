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
end
