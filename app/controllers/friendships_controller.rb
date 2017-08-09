class FriendshipsController < ApplicationController
  def create
    another = User.find(friendship_params[:friend_id])
    current_user.add_friend(another)

    redirect_to users_path
  end

  def destroy 
    Friendship.where(user: current_user, friend_id: params[:friend_id]).take.destroy
  redirect_to users_path
  end

  def friendship_params
    params.require(:friendship).permit(friend_id)
  end
end
