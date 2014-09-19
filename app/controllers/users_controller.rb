class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(username: params[:user][:username],
                    password: params[:user][:password],
                    email: params[:user][:email])

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for registering, #{@user.username}"
      redirect_to root_path
    else
      flash[:error] = "Uh oh.... There was an issue."
      render :new
    end
  end

end