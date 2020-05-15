class UsersController < ApplicationController

    def index 
        # render plain: "I'm in the index action!"
        # render json: params
        users = User.all 
        render json: users 

    end

    def create
        # render json: params #query string 
        #  user = User.new(params.require(:user).permit(:name, :email))
         user = User.new(user_params)
         #user: new instance of user 
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
         
        #  if user.update(params.require(:user).permit(:name, :email))
        if user.update(user_params)
            redirect_to "/users/#{user.id}" #/users/:id
            #user_url(user.id) #helper function
            #users: route's name 
            #"/users/#{user.id}" routh path 

            #users_url
         else
            render json: user.errors.full_messages, status: 422
         end
    end

    def destroy
        user = User.find(params[:id])
        user.destroy 
        render json: user 
    end

    private
    def user_params
        params.require(:user).permit(:name, :email)
    end
end