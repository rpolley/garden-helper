class Plant < ApplicationRecord
  has_one :etl_meta, as: :etl_record
  months = [:january, :february, :march, :april, :may, :june, :july, :august, :september, :october, :november, :december]
  flag :fruit_months, months
  flag :growth_months, months
end