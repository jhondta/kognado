# frozen_string_literal: true

class Maintenance::Asset < ApplicationRecord
  belongs_to :maintenance_asset_type
  belongs_to :configuration_area
  belongs_to :maintenance_manufacturer
end
