class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :logined?, :current_user

  protected

  def must_login
    unless logined?
      flash[:error] = "请先登录"
      redirect_to root_path
      return 
    end
  end

  def logined?
    session[:user_id].present?
  end

  def current_user
    return nil unless logined?
    @current_user ||= User.find session[:user_id]
  end

end
