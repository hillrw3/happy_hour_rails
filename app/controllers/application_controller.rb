class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def initialize
    super
    @client = Yelp::Client.new(:consumer_key    => '2C6rgKhf0AD8oMvkSxkeMA',
                               :consumer_secret => 'd_G_9y--T3Zo3xZBmCHsBAxlHvU',
                               :token           => 'twcpJoSxXdafBrAXUwyJjQ-RWEOEgJcH',
                               :token_secret    => '0P4Q5MUWLRK85lGm0CneI5K01pg')
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

end
