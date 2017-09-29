class UsersController < ApplicationController

  def my_portfolio
    @user_stock = current_user.stocks
    @user = current_user
  end

  def my_friends
    @friendships = current_user.friends
  end

  def show
    @user = User.find(params[:id])
    @user_stocks = @user.stocks
  end

  def search
    @users = User.search(params[:search_param])

    if @users
      @users = current_user.except_current_user(@users)
      render partial: "friends/lookup"
    else
      render status :not_found, nothing: true
    end
  end

  def add_friend
    @friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: @friend.id)

    if current_user.save
      redirect_to my_friends_path, notice: "Friend was successfully added."
    else
      redirect_to my_friends_path, flash[:error] = "Adding failed"
    end
  end

  def remove_friend
    a = params[:friend].to_i
    b = params[:user].to_i
    debugger
    @friendship = Friendship.find_by(user_id: b, friend_id: a);

    @friendship.destroy
    respond_to do |format|
      format.html { redirect_to my_friends_path, notice: 'A person was successfully remove from your friend list.' }
      format.json { head :no_content }
    end
  end
end
