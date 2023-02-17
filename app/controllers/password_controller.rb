class PasswordController < ApplicationController
  def forget_password
    if request.post?
      @user = User.find_by_email(params[:email])
      if @user
        new_password = create_random_password
        @user.update(:password=>new_password)
        UserNotificationMailer.forget_password_mail(@user, new_password).deliver
        puts "$$$$$$$$$$$$$$"
        puts new_password
        redirect_to account_login_url
      else
        flash[:notice] = "Please enter valid email_id."
        render :action=>forget_password
      end  
    end  
  end

  def create_random_password
    (0...6).map{(65 + rand(26)).chr }.join
  end

  def reset_password
    @user = User.find_by_id(session[:user])
    if request.post?
      
      if @user
        if @user.update(user_params)
          flash[:notice]= "Your password has been reset."
          redirect_to account_dashboard_url
        else
          flash[:notice] = "Enter valid password."
          render :action=>:reset_password
        end
      end    
    end
  end

  def user_params
   params.permit(:password,:password_confirmation)
  end  
end  
