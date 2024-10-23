# frozen_string_literal: true

class CreateMaintenanceAssets < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_assets do |t|
      t.string :code, null: false, limit: 10, index: { unique: true }
      t.string :name, null: false, limit: 100
      t.references :maintenance_asset_type, null: false, foreign_key: true
      t.references :configuration_area, null: false, foreign_key: true
      t.references :maintenance_manufacturer, null: false, foreign_key: true
      t.string :model
      t.string :serial_number
      t.date :manufacturing_date
      t.date :purchase_date
      t.date :warranty_expiration
      t.integer :status
      t.string :criticality_level
      t.jsonb :technical_specs
      t.jsonb :operation_conditions
      t.text :physical_locaion
      t.text :notes

      t.timestamps
    end
  end
end
