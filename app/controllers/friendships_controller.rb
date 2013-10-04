class FriendshipsController < ApplicationController
  def create
    friendship = Friendship.find(params[:friendship_id])
    current_user.add_friend(friendship.user)
    redirect_to profile_path(current_user)
  end

  def destroy
    friendship = Friendship.find(params[:friendship_id])
    current_user.remove_friend(friendship.user)
    redirect_to profile_path(current_user)
  end
end
