class SessionsController < ApplicationController

    before_action :back_to_cat_index, only: [:index]

    def new 
        @user = User.new
    
    end


    def create 
        user_name = params[:user][:user_name]
        password = params[:user][:password]
        user = User.find_by_credentials(user_name, password)
        if user
           login(user)
           redirect_to cats_url
           
        else
            render json: 'You did it wrong!'
        end
    end

    def destroy
        logout
        redirect_to new_session_url
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password_digest, :session_token)
    end
end
