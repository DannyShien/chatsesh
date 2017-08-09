class SessionsController < ApplicationController
  def new
  end

  def create
    if @user = User.find_by(email: params[:email])
      if @user.authenticate(params[:password])
        log_in(@user)
        redirect_to root_path, flash: {notice: "Logged In."}
      else
        redirect_to new_session_path, flash: {notice: "Invalid Password."}
      end
    else
      redirect_to new_session_path, flash: {notice: "Invalid Email"}
    end
  end

  def destroy
    log_out
    redirect_to root_path, flash: {notice: "Logged out."}
  end
end
