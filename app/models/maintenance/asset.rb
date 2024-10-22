# frozen_string_literal: true

class Maintenance::Asset < ApplicationRecord
  # Associations
  belongs_to :asset_type, class_name: 'Maintenance::AssetType',
             foreign_key: :maintenance_asset_type_id
  belongs_to :area, class_name: 'Configuration::Area',
             foreign_key: :configuration_area_id
  belongs_to :manufacturer, class_name: 'Maintenance::Manufacturer',
             foreign_key: :maintenance_manufacturer_id

  # Validations

  # Scopes

  # Callbacks
  has_paper_trail
end
