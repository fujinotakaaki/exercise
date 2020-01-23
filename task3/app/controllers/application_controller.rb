class ApplicationController < ActionController::Base
  #ログイン認証に必要なページに行く場合、ログインされていなければログイン画面へ飛ばす
  before_action :authenticate_user! #:except => [:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
