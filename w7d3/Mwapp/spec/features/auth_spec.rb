require 'rails_helper'
require 'spec_helper'

feature 'the signup process' do
    background :each do 
        visit new_user_path 
    end
  scenario 'has a new user page' do
    expect(page).to have_content("Sign Up")
  end

  feature 'signing up a user' do

    scenario 'shows username on the homepage after signup'

  end
end

feature 'logging in' do
  scenario 'shows username on the homepage after login'

end

feature 'logging out' do
  scenario 'begins with a logged out state'

  scenario 'doesn\'t show username on the homepage after logout'

end