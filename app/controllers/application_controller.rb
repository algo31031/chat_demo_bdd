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
    current_user.present?
  end

  def current_user
    @current_user ||= User.find_by_id session[:user_id]
  end

end
