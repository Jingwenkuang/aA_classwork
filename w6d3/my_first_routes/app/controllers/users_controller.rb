class UsersController < ApplicationController

    def index 
        # render plain: "I'm in the index action!"
        # render json: params
        users = User.all 
        render json: users 

    end

    def create
        # render json: params #query string 
         user = User.new(params.require(:user).permit(:name, :email))
        if user.save
            render json: user
        else
            render json: user.errors.full_messages, status: :unprocessable_entity
         end
    end

    def show 
        user = User.find(params[:id])
        render json: user
    #    render json: params #wildcard
    end

    def update
         user = User.find(params[:id])
         
         if user.update(params.require(:user).permit(:name, :email))
            redirect_to "/users/#{user.id}"
         else
            render json: user.errors.full_messages, status: 422
         end
    end
end