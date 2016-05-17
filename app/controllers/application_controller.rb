class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  unless Rails.env.development?
    protect_from_forgery with: :exception
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << reader_attributes
  end

  def reader_attributes
    attributes = [:first_name, :last_name, :address, :postcode, :city, :avatar]
  end
end
