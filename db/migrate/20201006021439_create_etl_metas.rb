class CreateEtlMetas < ActiveRecord::Migration[6.0]
  def change
    create_table :etl_meta do |t|
      t.datetime :last_runtime
      t.integer :etl_version
      t.references :etl_record, polymorphic: true, index: true
    end
  end
end
