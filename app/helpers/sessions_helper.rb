module SessionsHelper

    def user_signed_in?
        !!session[:user_id]
    end
    
    def employee_signed_in?
        !!session[:employee_id]
    end
    
end
