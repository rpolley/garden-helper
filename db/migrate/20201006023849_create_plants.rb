class CreatePlants < ActiveRecord::Migration[6.0]
  def change
    create_table :plants do |t|
      t.integer :days_to_harvest
      t.decimal :ph_maximum
      t.decimal :ph_minimum
      t.integer :prefered_light
      t.decimal :prefered_atmospheric_humidity
      t.integer :row_spacing
      t.integer :spread
      t.string :minimum_root_depth
      t.decimal :prefered_sand_vs_clay_silt
      t.integer :prefered_nutrients
      t.string :prefered_soil_humidity
      t.string :nitrogen_filtration
      t.string :average_hight
      t.decimal :minimum_tempurature
      t.decimal :maximum_temperature
    end
  end
end
