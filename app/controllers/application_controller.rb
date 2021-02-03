class ApplicationController < ActionController::Base

    helper_method :user_signed_in?, :current_user

    def user_signed_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by_id(session[:user_id]) if user_logged_in?
    end
end
