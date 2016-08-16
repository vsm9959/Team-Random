class UsersController < ApplicationController
    def new
        
        @user =User.new
    end
    def create
        @user = User.new(user_params)
      # if User.exists?(@user.email)
      #redirect_to login_path, :notice => "You have already signed up"
      #end
        respond_to do |format|
            if @user.save
                UserMailer.welcome_email(@user).deliver_now
                session[:user_auth_token] = @user.auth_token
             format.html{   redirect_to root_url}
            elsif User.exists?(email: @user.email)
                format.html{ redirect_to login_path
                    flash[:notice] = 'You have already signed up'
                }
            else
               format.html{ redirect_to '/signup'}
            end
        end
    end
    private
    def user_params
        params.require(:user).permit(:first_name,:last_name,:email,:password)
    end
        
end
