class FriendshipsController < ApplicationController
  def create   
    friend = User.find(params[:friend])
    @user_friend = Friendship.create(user: current_user, friend: friend)

    flash[:notice] = "User #{friend.full_name} was added as your friend"
    redirect_to friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    if friendship.destroy
      flash[:notice] = "User was successfully removed as your friend"
      redirect_to friends_path
    end
  end
end