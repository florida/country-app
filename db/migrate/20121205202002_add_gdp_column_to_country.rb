class AddGdpColumnToCountry < ActiveRecord::Migration
  def change
    add_column :countries, :gdp, :float
  end
end
