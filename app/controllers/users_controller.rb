class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(allowed_parameters)

    if @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Thanks for registering, #{@user.username}"
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def allowed_parameters
    params.require(:user).permit(:username, :email, :password)
  end

end