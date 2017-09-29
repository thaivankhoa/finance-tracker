class FriendshipsController < ApplicationController
  def destroy
    debugger
    @friendship = current_user.friendships.where(friend_id: params[:id]).first
    @friendship.destroy

    respond_to do |format|
      format.html { redirect_to my_friends_path, notice: 'A person was successfully remove from your friend list.' }
      format.json { head :no_content }
    end
  end
end
