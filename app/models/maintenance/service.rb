# frozen_string_literal: true

class Maintenance::Service < ApplicationRecord
  # Associations
  belongs_to :frequency, class_name: 'Maintenance::Frequency',
             foreign_key: :maintenance_frequency_id
  belongs_to :responsible, class_name: 'Maintenance::Responsible',
             foreign_key: :maintenance_responsible_id

  # Validations
  validates :name, :description, :scheduled_date, :maintenance_frequency,
            :maintenance_responsible, :status, presence: true
  validates :name, uniqueness: true, length: { minimum: 3, maximum: 255 }
  validates :scheduled_date, comparison: { greater_than_or_equal_to: Date.today }
  validates :status, inclusion: { in: %w[active inactive] }

  # Scopes
  scope :active, -> { where(status: 'active') }
end
