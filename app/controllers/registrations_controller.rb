class RegistrationsController < Devise::RegistrationsController

    private

    def sign_up_params
        params.require(:user).permit(:name, :contact, :email, :password, :password_confirmation)
    end

    def show
        params.require(:user).permit(:name, :contact, :email)
    end

    def account_update_params
        params.require(:user).permit(:name, :contact, :email, :password, :password_confirmation, :current_password)
    end

end