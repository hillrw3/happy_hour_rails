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
    @location.build_special
  end

  def create
    @location = Location.new(allowed_parameters)
    geocodes = geocode_address(@location.address)
    @location.latitude = geocodes["lat"].to_f
    @location.longitude = geocodes["lng"].to_f
    if @location.save
      flash[:notice] = "Location successfully added!"
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update_attributes(allowed_parameters)
    # binding.pry
    geocodes = geocode_address(@location.address)
    @location.latitude = geocodes["lat"].to_f
    @location.longitude = geocodes["lng"].to_f
    flash[:notice] = "#{@location.name} was successfully updated!"
    redirect_to location_path(@location)
  end


  private

  def geocode_address (address)
    sleep(0.11)
    results = Geocoder.search(address).to_json
    JSON.parse(results)[0]["data"]["geometry"]["location"]
  end

  def allowed_parameters
    params.require(:location).permit(:name, :address, :phone, :website, special_attributes: [:starts_at, :ends_at, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday])
  end

end