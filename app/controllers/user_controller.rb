class UserController < ApplicationController
  def show
    if logged_in?
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def new
    @user = User.new
  end

  def edit
    if logged_in?
      @user = current_user
    else
      redirect_to login_path
    end
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = 'User was successfully created.'
      session[:user_id] = @user.id
      redirect_to(show_user_path)
    else
      render :action => "new"
    end
  end

  def update
    @user = current_user
    if @user.update_attributes(params[:user])
      flash[:notice] = 'User was successfully updated.'
      redirect_to(show_user_path)
    else
      render :action => "edit"
    end
  end
  
  

end
