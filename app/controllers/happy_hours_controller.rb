class HappyHoursController < ApplicationController

  def index
    @happy_hours = Location.all
  end

  def show
    @happy_hour = Location.find(params[:id])
  end

  def new
    @happy_hour = Location.new
  end

  def create
    @happy_hour = Location.new(name: params[:location][:name],
                               address: params[:location][:address],
                               latitude: geocode_address(params[:location][:address])["lat"],
                               longitude: geocode_address(params[:location][:address])["lng"],
                               description: params[:location][:description],
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