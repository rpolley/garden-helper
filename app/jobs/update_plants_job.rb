require 'rest-client'
require 'json'
class UpdatePlantsJob < ApplicationJob
  queue_as :trefle_etl

  def perform(*args)
    # Do something later
    @refresh_cutoff = 1.week.ago
    @etl_version = 1
    @api_base_url = "https://trefle.io/api/v1"
    @api_token = Rails.application.credentials.api_token.trefle
    @logger = Rails.logger
    plants = edible_plants
    plants.each do |page|
      page.each do |plant_item|
        slug = plant_item[:slug]
        db_plant_record = Plants.find_by(slug: slug)
        next unless stale(db_plant_record)
        api_id = plant_item[:id]
        full_item = api_request("plants/#{api_id}")
        sync full_item[:data], :to db_plant_record
      end
    end
  end

  def stale(it)
    it.nil? || it.etl_meta.etl_version < @etl_version || it.etl_meta.last_runtime < @refresh_cutoff
  end

  def sync(from, to=nil)
    to = Plant.new if to.nil?
    # save off metadata
    to.etl_meta.last_runtime = DateTime.now
    to.etl_meta.etl_version = @etl_version
    # save off plant info
    to.slug = from[:slug]
    to.common_name = from[:common_name]
    to.image_url = from[:image_url]
    main_species = from[:main_species]
    specs = main_species[:specifications]
    to.average_height = specs[:average_height][:cm]
    to.nitrogen_fixation = !specs[:nitrogen_fixation].nil?
    growth = main_species[:growth]
    to.days_to_harvest = growth[:days_to_harvest]
    to.row_spacing = growth[:row_spacing][:cm]
    to.ph_maximum = growth[:ph_maximum]
    to.ph_minimum = growth[:ph_minimum]
    to.prefered_light = growth[:light]
    to.prefered_atmospheric_humidity = growth[:atmospheric_humidity]
    fruit_months = growth[:fruit_months]
    to.fruit_months = fruit_months.map { | month | month.downcase.to_sym }
    growth_months = growth[:growth_months]
    to.growth_months = growth_months.map { | month | month.downcase.to_sym }
    to.maximum_precipitation = growth[:maximum_precipitation][:mm]
    to.minimum_precipitation = growth[:minimum_precipitation][:mm]
    to.maximum_temperature = growth[:maximum_temperature][:deg_c]
    to.minimum_temperature = growth[:minimum_tempurature][:deg_c]
    to.prefered_soil_nutrients = growth[:soil_nutrients]/10.0
    to.prefered_sand_vs_clay_silt = growth[:soil_texture]/10.0
    to.maximum_salinity = growth[:soil_salinity]/10.0
    to.prefered_soil_humidity = growth[:soil_humidity]/10.0
    to.save!
  end

  def paged_api_request(endpoint, params={})
    head = api_request(endpoint, params)
    page_count = head[:meta][:total]
    (1..page_count).map do |page_num|
      params[:page] = page_num
      api_request(endpoint, params)
    end
  end

  def api_request
    params[:token] = @api_token
    url = "#{@api_base_url}/#{endpoint}"
    response = RestClient.get @api_base_url, {accept: :json, params: params}
    JSON.parse(response)
  end

  def edible_plants
    api_request('/plants', {filter_not: {edible: nil}})
  end
end