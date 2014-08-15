class UsersController < ApplicationController

  def signin
    @user = User.new
  end
end