class UsersController < ApplicationController
    def new
        @user =User.new
    end
    def create
        @user = User.new(user_params)
        respond_to do |format|
            if @user.save
                UserMailer.welcome_email(@user).deliver_now
                session[:user_id] =@user.id
             format.html{   redirect_to '/'}
            else
                redirect_to '/signup'
            end
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password)
    end
        
end
