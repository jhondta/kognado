# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  layout 'application'
  before_action :authenticate_user!
  include HttpAcceptLanguage::AutoLocale
end
