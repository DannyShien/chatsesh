class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  def current_user
    return @current_user if @current_usser

    @current_user = User.find_by(id: session[:user_id])
  end

  def log_in(user)
    session[:user_id] = user.id
  end

  def log_out
    session[:user_id] = nil
  end
end

