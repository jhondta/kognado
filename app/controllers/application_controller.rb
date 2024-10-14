# frozen_string_literal: true

# Application controller
class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!
  include HttpAcceptLanguage::AutoLocale
  include Pagy::Backend
end
