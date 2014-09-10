class HappyHoursController < ApplicationController

  def index

  end

  def new
    @happy_hour = Location.new
  end

  def create
    @happy_hour = Location.new(name: params[:location][:name],
                               address: params[:location][:address],
                               latitude: geocode_address(params[:location][:address])["lat"],
                               longitude: geocode_address(params[:location][:address])["lng"],
                               phone: params[:location][:phone]
    )

    if @happy_hour.save
      flash[:notice] = "Location successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end



  private

  def geocode_address (address)
    results = Geocoder.search(address).to_json
    JSON.parse(results)[0]["data"]["geometry"]["location"]
  end

end