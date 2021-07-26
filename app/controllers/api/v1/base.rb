class Api::V1::Base < ApplicationController
  #include ActionController::Cookies # config/applicationでincludeしていたら不要かもしれない
  include ActionController::RequestForgeryProtection
  protect_from_forgery with: :exception
  after_action :set_csrf_token_header
  before_action :current_user

  def set_csrf_token_header
    response.set_header('X-CSRF-Token', form_authenticity_token)
  end

  def current_user
    @current_user = User.find(session[:user_id]) if session[:user_id]
  end
end