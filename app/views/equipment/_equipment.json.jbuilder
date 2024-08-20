# frozen_string_literal: true

json.extract! equipment, :id, :name, :asset_type_id, :serial_number, :purchase_date, :warranty_expiry, :location_id, :status, :manufacturer, :model, :created_at, :updated_at
json.url equipment_url(equipment, format: :json)
