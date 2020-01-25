class ApplicationController < ActionController::Base
  #ログイン認証に必要なページに行く場合、ログインされていなければログイン画面へ飛ばす
  before_action :authenticate_user! #:except => [:about]
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #↓これはログイン時にemailの代わりにnameで代替できるわけではない
    #devise_parameter_sanitizer.permit(:sign_in, keys: [:name])
    #emailじゃなくてnameでログインするには'config/initializers/devise.rb'をいじるだけで良さそう。
    #もちろんusersモデルにnameのカラムを追加する必要あり
  end
end
