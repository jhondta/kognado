# frozen_string_literal: true

class CreateEquipment < ActiveRecord::Migration[7.1]
  def change
    create_table :equipment do |t|
      t.string :name
      t.references :asset_type, null: false, foreign_key: true
      t.string :serial_number
      t.date :purchase_date
      t.date :warranty_expiry
      t.references :location, null: false, foreign_key: true
      t.string :status
      t.string :manufacturer
      t.string :model

      t.timestamps
    end
  end
end
