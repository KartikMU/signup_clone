class AccountController < ApplicationController
  def signup
    @user = User.new
    if request.post?
      @user = User.new(user_params)
      if @user.save
        UserNotificationMailer.signup_mail(@user).deliver
        redirect_to :action=>"login"
      else
        render :action=> "signup"
      end  
    end  
  end

  def login
    if request.post?
      @user = User.authenticate(params[:email],params[:password])
      if @user
        session[:user]=@user.id
        redirect_to :action=>:dashboard
      else
        flash[:notice]="Enter the valid Email_id/Password."
        render :action=>:login
      end
    end      
  end

  def logout
    session.delete[:user]
    redirect_to account_login_url
  end  

  

  def user_params
    params.permit(:first_name,:last_name,:mobile,:email,:password,:password_confirmation,:encrypted_password)
  end 
end
