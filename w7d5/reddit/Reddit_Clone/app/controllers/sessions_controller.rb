class SessionsController < ApplicationController

    before_action :require_logged_in, only: :destroy
#login create a session 
#logout destroy a session

    def new 
        @user = User.new 
        render :new 
    end 

    def create 
        user = User.find_by_credentials(params[:user][:username], params[:user][:password])
        if user 
            login(user)
            redirect_to user_url(user) #user#show 
        else
            flash[:errors] = ["Wrong username or password"]
            redirect_to new_session_url 
        end 
    end 

    def destroy 
        logout 
    end

  
end
