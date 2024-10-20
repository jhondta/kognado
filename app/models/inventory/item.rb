# frozen_string_literal: true

class Inventory::Item < ApplicationRecord
  # Associations
  belongs_to :measure_unit

  # Validations
  validates :name, :sku, :description, presence: true
  validates :name, length: { minimum: 1, maximum: 100 }
  validates :sku, length: { minimum: 1, maximum: 100 }, uniqueness: true
end
