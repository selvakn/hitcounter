class SessionsController < ApplicationController
  def new
    @title = "Login"
  end
  
  def create
    user = params[:user]
    @user = User.find(:first, :conditions => {:name => user[:name], :password => user[:password]})
    if @user.nil?
      flash[:error] = 'Invalid username/password'
      redirect_to login_path
    else
      flash[:notice] = 'Login successful'
      session[:user_id] = @user.id
      redirect_to show_user_path
    end  
  end
  
  def destroy
    reset_session
    flash[:notice] = 'Logged out successful'
    redirect_to login_path
  end
end
