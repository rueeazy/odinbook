class FriendshipsController < ApplicationController

    def create
        @friendship = current_user.friendships.build(friend_id: params[:friend_id], confirmed: false)
        if @friendship.save
            flash[:notice] = "Friend Request Sent."
            redirect_to request.referrer
        else
            flash[:notice] = "Unable to send friend request."
            redirect_to request.referrer
        end
    end

    def update
        @user = User.find_by(id: params[:id])
        current_user.confirm_friend(@user)
        flash[:notice] = "Friend Request Accepted!"
        redirect_to friendships_path
    end

    private

    def friend_params
        params.require(:user).permit(:friend_id, :user_id, :confirmed)
    end

end
