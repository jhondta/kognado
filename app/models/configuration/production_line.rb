# frozen_string_literal: true

class Configuration::ProductionLine < ApplicationRecord
  # Associations
  belongs_to :configuration_area, class_name: 'Configuration::Area',
             foreign_key: :configuration_area_id
end
