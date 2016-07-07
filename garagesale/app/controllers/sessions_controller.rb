class SessionsController < ApplicationController
    def new
    end
    def create
      
        @user = User.find_by_email(params[:session][:email])
     
        if @user && @user.authenticate(params[:session][:password])
                session[:user_auth_token] = @user.auth_token
                redirect_to '/', :notice => "Logged in"
        else
                flash.now.alert = "Invalid email or password"
                redirect_to '/login'
        end
    end
    def destroy
        session[:user_auth_token] = nil
        redirect_to '/', :notice => "Logged out!"
    end
end
