class SessionsController < ApplicationController

    def new #get/login

    end

    def create #post/login

    end

    def destroy #delete/logout
        session.clear
        redirect_to root_path	
    end
end


