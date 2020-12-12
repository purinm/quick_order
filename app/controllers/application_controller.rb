class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
   # before_action :basic_auth

   def after_sign_in_path_for(resource)
    items_path # ログイン後に遷移するpathを設定
   end

  # def after_sign_out_path_for(resource)
  #   new_user_session_path # ログアウト後に遷移するpathを設定
  # end


  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name,:phone_number])
    # devise_parameter_sanitizer.permit(:account_update, keys: [:name,:phone_number])
  end
end
