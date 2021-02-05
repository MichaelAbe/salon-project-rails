class ApplicationController < ActionController::Base

    helper_method :user_signed_in?, :current_user

    def user_signed_in?
        !!session[:user_id]
    end

    def current_user
        @user = User.find_by_id(session[:user_id]) if user_signed_in?
    end

    def login_user
        session[:user_id] = @user.id
    end

    def employee_signed_in?
        !!session[:employee_id]
    end

    def current_employee
        @employee = Employee.find_by_id(session[:employee_id]) if employee_signed_in?
        
    end

    def login_employee
        session[:employee_id] = @employee.id
    end


    def redirect_if_not_user
        if !current_user
            redirect_to '/problem'
        end   

    def redirect_if_not_employee
        if !current_employee
            redirect_to '/problem'
        end
    end

end

