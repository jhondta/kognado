# frozen_string_literal: true

json.extract! asset_type, :id, :name, :description, :created_at, :updated_at
json.url asset_type_url(asset_type, format: :json)
