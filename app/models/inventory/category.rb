# frozen_string_literal: true

class Inventory::Category < ApplicationRecord
  # Associations

  # Validations
  validates :name, :description, presence: true
  validates :name, uniqueness: true, length: { minimum: 1, maximum: 100 }
  validates :description, length: { minimum: 1, maximum: 255 }
end
