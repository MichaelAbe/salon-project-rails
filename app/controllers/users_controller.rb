class UsersController < ApplicationController

    def new
        @user = User.new
    end

    def create 
        @user = User.new(user_params)
            if @user.save 
                login_user 
                redirect_to appointments_path
                flash[:notice] = "Welcome to the App!"
            else
                flash.now[:error] = @user.errors.full_messages
                render :new
            end
    end

    private

    def user_params
        params.require(:user).permit(:email, :password)
    end

end

