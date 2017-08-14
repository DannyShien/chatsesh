class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :current_user

  private
  
  def require_login
    if @current_user == current_user
      flash[:error] = "Access denied!"
      redirect_to root_path
    end
  end

  def login(user)
    session[:user_id] = user.id
  end

  def logout(user)
    session[:user_id] = nil
  end

  def current_user
    return @current_user if @current_user
    @current_user = User.find_by(id: session[:user_id])
  end

end