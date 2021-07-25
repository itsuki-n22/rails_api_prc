class Api::V1::Base < ApplicationController
  include ActionController::Cookies
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  after_action :set_csrf_token_header

  def set_csrf_token_header
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end
end