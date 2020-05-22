require 'rails_helper'

RSpec.describe UsersController, type: :controller do

    describe 'GET#new' do
        it 'renders the new users template' do
            get :new 
            expect(response).to render_template(:new)
        end
    end

    describe 'POST#create' do 
        let(:user_params) do 
            {user: {username: 'wednesday', password: 'password'} }
        end
        
        context 'with valid params' do 
            it 'logs in the user' do 
                post :create, params: user_params
                user = User.find_by(username: 'wednesday')
                expect(session[:session_token]).to eq(user.session_token)
            end
            
            it 'redirect to the user\'s show page' do 
                post :create, params: user_params
                user = User.find_by(username: 'wednesday')
                expect(response).to redirect_to(user_url(user))
            end
        end
        
        context 'with invalid params' do
            it 'validates the presence of password and renders new template with errors' do
                post :create, params: {user: {username: 'wednesday', password: ''} }
                
                expect(response).to render_template(:new)
                expect(flash[:errors]).to be_present
            end 
        end
    end

    describe 'GET#show' do 
    let(:user) {User.create!(username: 'wednesday', password: 'password')}
        it 'renders the show user template' do
            get :show, params: {id: user.id}
            fetched_user = controller.instance_variable_get(:@user)
            expect(fetched_user).to eq(user)
            expect(response).to render_template(:show)
        end
    end

    describe 'GET#index' do 
        it 'renders the index users template' do
            get :index
            fetched_users = controller.instance_variable_get(:@users)
            expect(fetched_users).to eq(User.all)
            expect(response).to render_template(:index)
        end
    end

    describe 'DELETE#destroy' do 
        it 'removes a user from the database and redirects to the user index' do 
            user = User.create!(username: 'wednesday', password: 'password')
            delete :destroy, params: {id: user.id}
            expect(User.exists?(user.id)).to be false 
            expect(response).to redirect_to(users_url)
        end

    end

end
