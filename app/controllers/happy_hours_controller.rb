class HappyHoursController < ApplicationController

  def index

  end

  def new
    @happy_hour = Location.new
  end

end