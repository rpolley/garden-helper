class EtlMeta < ApplicationRecord
  belongs_to :etl_record, polymorphic: true
end