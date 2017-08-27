class UsersController < ApplicationController
  before_action :require_login, only: [:index]  

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      login(@user)  
      flash[:success] = "User created."
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @user = current_user
  end

  def update
    current_user.update(user_params)
    redirect_to root_path
  end

  def index
    @users = User.all.order("created_at DESC")
  end

  def search
    @user = User.autocomplete(params[:q])
    respond_to do |format|
      format.json
    end
  end

  def profile 
    @user = User.find(params[:id].to_i)
    @posts = @user.posts.order("created_at DESC")
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :avatar, :password, :password_confirmation)
  end


end
