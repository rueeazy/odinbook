class FriendshipsController < ApplicationController

    def create
        @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
        if @friendship.save
            flash[:notice] = "Friend Request Sent."
            redirect_to root_url
        else
            flash[:notice] = "Unable to send friend request."
            redirect_to root_url
        end
    end

    private

    def friend_params
        params.require(:user).permit(:friend_id, :user_id, :confirmed)
    end

end
