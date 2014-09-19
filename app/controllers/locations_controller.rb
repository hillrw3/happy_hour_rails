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
    if params[:location][:address] == ''
      @location = Location.new
      @location.errors.add(:address, "can't be blank")
      render :new
    else
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
  end

  def edit
    @location = Location.find(params[:id])
  end

  def update
    @location = Location.find(params[:id])
    @location.update(name: params[:location][:name],
    )
    @special = @location.special.update(params[:location][:special])
    flash[:notice] = "#{@location.name} was successfully updated!"
    redirect_to location_path(@location)
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

  def allowed_parameters
    params.require(:location).permit(:name, :address, :phone, :website, special_attributes: [:id, :sunday, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday])
  end


end