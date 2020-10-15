class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
    @tracked_stocks = @user.stocks
  end

  def portifolio
    @user = current_user
    @tracked_stocks = current_user.stocks
  end
  
  def friends
    @friends = current_user.friends
  end  
  
  def search
    if params[:friend].present?
      @friends = User.search(params[:friend])
      @friends = current_user.except_current_user(@friends)
      if @friends
        respond_to do |format|
          format.js { render partial: 'users/friend_result' }
        end
      else
        respond_to do |format|
          flash.now[:alert] = "Friend not found"
          format.js { render partial: 'users/friend_result' }
          format.html { redirect_to friends_path }
        end
      end
    else
      respond_to do |format|
        flash.now[:alert] = "Please enter a valid name or email"
        format.js { render partial: 'users/friend_result' }
          format.html { redirect_to friends_path }
      end
    end
  end

end
