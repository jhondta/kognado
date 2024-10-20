# frozen_string_literal: true

class Inventory::ItemCategory < ApplicationRecord
  # Associations
  belongs_to :item
  belongs_to :category

  # Validations
  validates :item_id, uniqueness: { scope: :category_id }
end
