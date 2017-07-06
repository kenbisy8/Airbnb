class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  require "countries/global"


  before_action :set_user
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def set_user
    @user = User.new
  end

  def country_name(country)
    @country = Country.new(country)
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
