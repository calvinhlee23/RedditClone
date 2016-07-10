class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :login!, :logout!, :current_user

  def login!(user)
    session[:session_token] = user.reset_session_token!
    @current_user = user
  end

  def logout!(user)
    session[:session_token] = nil
    user.reset_session_token
    @current_user = nil
  end

  def current_user
    @current_user = User.find_by_session_token(session[:session_token])
    @current_user
  end
end