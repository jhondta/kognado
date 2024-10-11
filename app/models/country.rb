# frozen_string_literal: true

class Country < ApplicationRecord
  has_many :country_currencies
  has_many :country_timezones
  has_many :country_languages

  has_many :currencies, through: :country_currencies
  has_many :timezones, through: :country_timezones
  has_many :languages, through: :country_languages
end
