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
      t.decimal :prefered_nutrients
      t.string :prefered_soil_humidity
      t.boolean :nitrogen_fixation
      t.string :average_height
      t.decimal :minimum_tempurature
      t.decimal :maximum_temperature
      t.string :slug
      t.string :common_name
      t.string :image_url
      t.integer :fruit_months, null: false, default: 0
      t.integer :growth_months, null: false, default: 0
      t.decimal :maximum_precipitation
      t.decimal :minimum_precipitation
      t.decimal :maximum_soil_salinity
    end
  end
end
