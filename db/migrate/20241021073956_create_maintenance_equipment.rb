# frozen_string_literal: true

class CreateMaintenanceEquipment < ActiveRecord::Migration[7.2]
  def change
    create_table :maintenance_equipment do |t|
      t.string :name
      t.text :description
      t.string :ubicación
      t.string :estado

      t.timestamps
    end
  end
end
