module SessionsHelper

    def user_signed_in?
        !!session[:user_id]
    end
    
end
