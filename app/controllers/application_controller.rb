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


    def redirect_if_not_allowed
        if !current_user
            redirect_to '/problem'
        elsif !current_employee
            redirect_to '/problem'
        end
    end

    def redirect_if_not_logged_in
        if !user_signed_in? && !employee_signed_in?
            redirect_to '/problem'
        else
        end
    end

    def wrong_user_check
        if @user != current_user
            reirect_to '/problem'
        end
    end

    def access?
        #byebug
        if !Appointment.exists?(params[:id])
            redirect_to '/problem'
        elsif !!@user and @user.id == @appointment.user_id && Appointment.find_by_id(params[:id]).user_id == @appointment.user_id
            appointment_path(@user) 
        elsif !!@employee and @employee.id == @appointment.employee_id && Appointment.find_by_id(params[:id]).employee_id == @appointment.employee_id
            appointment_path(@employee)
      
        else
            redirect_to '/problem'
        end
    end

end


#if !!Appointment.find_by_id(params[:appointment_id])


