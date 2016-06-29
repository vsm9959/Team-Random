class PasswordResetsController < ApplicationController

  def new
  end
  def create
    @user = User.find_by(email: params[:password_reset][:email].downcase)
    if @user
      @user.send_password_reset_email
      flash[:info] = "Email sent with password reset instructions"
      redirect_to root_url
    else
      flash[:notice] = "Your email doesn't exits signup"
      redirect_to '/signup'
    end
  end
  def edit
    @user = User.find_by_password_reset_token!(params[:id])
  end
  def update
    @user = User.find_by_password_reset_token!(params[:id])
  if @user.update_attributes(user_params)
    redirect_to root_url, :notice => "Password has been reset!"
  else
    render :edit
  end
  end
  private
    def user_params
      params.require(:user).permit(:password, :password_confirmation)
    end
  end
