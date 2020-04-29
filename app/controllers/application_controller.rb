class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  
def after_new_user_session_path_for(resource)
   user_path
end

def after_new_user_registration_path_for(resource)
	user_path
end

  protected
  def configure_permitted_parameters
  	devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
