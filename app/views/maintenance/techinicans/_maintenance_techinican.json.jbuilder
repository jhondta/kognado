# frozen_string_literal: true

json.extract! maintenance_techinican, :id, :user_id, :specialty, :certificacion_level, :active, :created_at, :updated_at
json.url maintenance_techinican_url(maintenance_techinican, format: :json)
