class UsersController < ApplicationController

    before_action :require_login, {expect: [:new, :create]}  
     #before_action, option hash 
     
    #new
    #create (create a new user to login)
    def index 
        @users = User.all  
        render :index
    end

    def show 
        @user = User.find(params[:id])
        if @user 
            render :show 
        else
            redirct_to users_url #index
        end
    end

    def new  #get a form 
        @user = User.new 
        render :new 
    end

    def create 
        @user = User.new(user_params)
        if @user.save
            login(@user)
            redirect_to users_url(@user)  #show 
        else
            flash.now[:errors] = @user.errors.full_messages 
            render :new 
        end
    end 

        def edit 
            @user = User.find_by(id: params[:id])
            render :edit 
        end

        def update 
            @user = User.find_by(id: params[:id])
           if @user.update(user_params)
                redirect_to user_url(@user)
           else
                flash.now[:errors] = @user.errors.full_messages 
                render :edit 
           end

        end

    private 
    def user_params
        params.require(:user).permit(:username, :password_digest, :session_token)
    end
end
