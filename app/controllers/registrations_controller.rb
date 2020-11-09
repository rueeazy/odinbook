class RegistrationsController < Devise::RegistrationsController

    def create
        super
        if @user.persisted?
            UserMailer.welcome_email(@user).deliver_now
        end
    end

    private

    def sign_up_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :bio, :avatar)
    end

    def account_update_params
        params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation, :current_password, :avatar, :bio)
    end


end
