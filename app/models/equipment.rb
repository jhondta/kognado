# frozen_string_literal: true

class Equipment < ApplicationRecord
  belongs_to :asset_type
  belongs_to :location
end
