# frozen_string_literal: true

class Maintenance::Equipment < ApplicationRecord
  has_one_attached :image
end
