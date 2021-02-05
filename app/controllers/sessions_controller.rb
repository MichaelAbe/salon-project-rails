class SessionsController < ApplicationController

    def google
        
        @user = User.find_or_create_by(email: auth["info"]["email"]) do |user|
            user.password = SecureRandom.hex(15)
        end
        if @user && @user.id 
            login_user
            redirect_to appointments_path
        else
            redirect_to root_path
        end
    end

    def new #get/login

    end

    def create #post/login
        @user = User.find_by_email(params[:email])
        if @user && @user.authenticate(params[:password])
            login_user #session[:user_id] = @user.id
            redirect_to appointments_path
        else
            flash.now[:error] = ["Email or Password incorrect"]
            render :new  
        end
    end

    def destroy #delete/logout
        session.clear
        redirect_to root_path	
    end

    def new_employee 
    end

    def create_employee
        @employee = Employee.find_by_username(params[:username])
        if @employee && @employee.authenticate(params[:password])
            login_employee # session[:employee_id] = @employee.id
            redirect_to appointments_path
        else
            flash.now[:error] = ["Username or Password incorrect"]
            render :new_employee
        end
    end

    private

    def auth
        request.env['omniauth.auth']
    end
end


