class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  protect_from_forgery

  def access_denied(exception)
    redirect_to root_path, alert: exception.message
  end

  protected
  
  def configure_permitted_parameters
    added_attrs = [:name, :surname, :phone_number, :avatar, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
