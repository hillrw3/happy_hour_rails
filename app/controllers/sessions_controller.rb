class SessionsController < ApplicationController

  def index
    redirect_to root_path
  end

  def new
  end

  def create
    @user = User.find_by(username: params[:user][:username], password: params[:user][:password])
    if @user
      session[:user] = @user.id
      flash[:notice] = "Hello again, #{@user.username}!"
      redirect_to root_path
    else
      flash[:error] = "Invalid username/password"
      render :new
    end
  end

  def destroy
    session.destroy
    redirect_to root_path
  end

end