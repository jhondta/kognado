# frozen_string_literal: true

class Maintenance::Asset < ApplicationRecord
  # Constants
  STATUS = %i[ active inactive maintenance retired ].freeze
  STATUS_COLORS = { active: 'green', inactive: 'red', maintenance: 'yellow',
                    retired: 'gray' }.freeze
  CRITICALITY_LEVEL = %i[ low medium high critical ].freeze
  CRITICALITY_COLORS = { low: 'green', medium: 'yellow', high: 'orange',
                         critical: 'red' }.freeze

  # Associations
  belongs_to :type, class_name: 'Maintenance::AssetType',
             foreign_key: :maintenance_asset_type_id
  belongs_to :area, class_name: 'Configuration::Area',
             foreign_key: :configuration_area_id
  belongs_to :manufacturer, class_name: 'Maintenance::Manufacturer',
             foreign_key: :maintenance_manufacturer_id

  has_many :maintenance_asset_assignees, class_name: 'Maintenance::AssetAssignee',
           foreign_key: :maintenance_asset_id
  has_many :asset_components, class_name: 'Maintenance::AssetComponent',
           foreign_key: :maintenance_asset_id
  has_many :asset_documents, class_name: 'Maintenance::AssetDocument',
           foreign_key: :maintenance_asset_id
  has_many :assignees, through: :maintenance_asset_assignees
  has_many :components, through: :asset_components
  has_many :documents, through: :asset_documents

  # Validations

  # Enums
  enum status: STATUS
  enum criticality_level: CRITICALITY_LEVEL

  # Delegations

  # Scopes

  # Callbacks
  has_paper_trail

  # Methods

  # Returns the status color
  # @return [String]
  #
  def status_color
    STATUS_COLORS[status.to_sym]
  end

  # Returns the criticality color
  # @return [String]
  #
  def criticality_color
    CRITICALITY_COLORS[criticality_level]
  end
end
