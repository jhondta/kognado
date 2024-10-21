# frozen_string_literal: true

json.extract! maintenance_equipment, :id, :name, :description, :image, :ubicación, :estado, :created_at, :updated_at
json.url maintenance_equipment_url(maintenance_equipment, format: :json)
json.image url_for(maintenance_equipment.image)
