class ApplicationController < ActionController::Base

    helper_method :current_user

    def current_user 
        @current_user ||= User.find_by(session_token: session[:session_token])
    end
    # if there is no @current_user, then it searches in session_token column for a session[:session_token]
    # that has a value. if no value is found, then there is no user.

    def login(user)
        session[:session_token] = user.reset_session_token!
        @current_user = user
    end

    def logout
        current_user.reset_session_token! if logged_in? 
        session[:session_token] = nil
        @current_user = nil 
    end

    def logged_in?
        !!current_user
    end

    def back_to_cats_index
        redirect_to cats_url if logged_in?
    end

end

# ?? where does session come from in login()
# session is independently provided by rails. acts as cookie (keeps track) to keep user logged in.
# if session has a value (is not nil) it means user is logged in.
#  AR keeps session_token