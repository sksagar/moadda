class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username])
  end

  def liked
    Like.where(user_id: current_user.id)
    #if session[:user_id]
      #@current_user ||= User.find(session[:user_id])
    #end
  end


  helper_method :liked
end
