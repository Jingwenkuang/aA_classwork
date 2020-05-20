class UsersController < ApplicationController

    before_action :back_to_cat_index, only: [:index]

    def new 
        @user = User.new
        render :new
    end

    def index 
        @user = User.all 
        render :index
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            redirect_to users_url
        else
            render :new 
        end
    end

    def show 
        @user = User.find(params[:id])
        if @user
            render :show
        else
            redirect_to users_url
            # redirects to index
        end
    end

    private
    def user_params
        params.require(:user).permit(:user_name, :password_digest, :session_token)
    end
end
