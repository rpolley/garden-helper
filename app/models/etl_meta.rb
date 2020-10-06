class ETLMeta < ApplicationRecord
  belongs_to :etl_record, polymorphic: true
end