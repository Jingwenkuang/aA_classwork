class UsersController < ApplicationController

    def index 
        @users = User.all 
        render :index
    end

    def show  
        @user = User.find(params[:id])
        # debugger
        render :show
        # else
        #     redirect_to users_url
        # end
    end

    def new
        @user = User.new
        render :new
    end

    def create
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to user_url(@user)
        else
            flash.now[:errors] = @user.errors.full_messages
            render :new
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_url
    end

    private
    def user_params
        params.require(:user).permit(:username, :password)
    end
end
