class RemoveUserIdFromFriendships < ActiveRecord::Migration[5.1]
  def change
    remove_column :friendships, :user_id, :string
    remove_column :friendships, :friend_id, :string
  end
end
