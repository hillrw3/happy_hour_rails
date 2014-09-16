class LocationsController < ApplicationController

  def index
    @locations = Location.all
  end

  def list
    @locations = Location.order(:name)
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
    @location = Location.new
  end

  def create
    if params[:location][:address] == ''
      @location = Location.new
      @location.errors.add(:address, "can't be blank")
      render :new
    else
      @location = Location.new(name: params[:location][:name],
                                 address: params[:location][:address],
                                 latitude: geocode_address(params[:location][:address])["lat"],
                                 longitude: geocode_address(params[:location][:address])["lng"],
                                 description: params[:location][:description],
                                 phone: params[:location][:phone]
      )
      if @location.save
        flash[:notice] = "Location successfully added!"
        redirect_to root_path
      else
        render :new
      end
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(name: params[:location][:name],
                       address: params[:location][:address],
                       latitude: geocode_address(params[:location][:address])["lat"],
                       longitude: geocode_address(params[:location][:address])["lng"],
                       description: params[:location][:description],
                       phone: params[:location][:phone]
    )
    flash[:notice] = "#{@location.name} was successfully updated!"
    redirect_to root_path
  end


  private

  def geocode_address (address)
    results = Geocoder.search(address).to_json
    JSON.parse(results)[0]["data"]["geometry"]["location"]
  end

  def location_present?
    if params[:location][:address] == ''
      @location.errors.add(:address, "can't be blank")
      render :new
    end
  end

end