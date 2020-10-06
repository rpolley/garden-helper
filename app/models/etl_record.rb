class ETLRecord < ApplicationRecord
  self.abstract = true
  has_one :etl_meta, class_name: "etl_meta", foreign_key: "etl_meta_id", as: :etlrecord
end