class Plant < ApplicationRecord
  has_one :etl_meta, class_name: "etl_meta", foreign_key: "etl_meta_id", as: :etlrecord
  Months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  flag :fruit_months, Months
  flag :growth_months, Months
end