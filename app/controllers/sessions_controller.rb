class SessionsController < ApplicationController

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
            render :new  
        end
    end
end


