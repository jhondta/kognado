# frozen_string_literal: true

class Configuration::ProductionLine < ApplicationRecord
  belongs_to :configuration_area
end
