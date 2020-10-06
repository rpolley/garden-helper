class CreateEtlMetas < ActiveRecord::Migration[6.0]
  def change
    create_table :etl_metas do |t|
      t.datetime :last_runtime
      t.integer :etl_version
      t.references :etlrecord, polymorphic: true
    end
  end
end
