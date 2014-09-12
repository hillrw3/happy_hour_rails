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
    if params[:location][:address] == ''
      @happy_hour = Location.new
      @happy_hour.errors.add(:address, "can't be blank")
      render :new
    else
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
  end

  def edit
    @happy_hour = Location.find(params[:id])
  end

  def update
    @happy_hour = Location.find(params[:id])
    @happy_hour.update(name: params[:location][:name],
                       address: params[:location][:address],
                       latitude: geocode_address(params[:location][:address])["lat"],
                       longitude: geocode_address(params[:location][:address])["lng"],
                       description: params[:location][:description],
                       phone: params[:location][:phone]
    )
    flash[:notice] = "#{@happy_hour.name} was successfully updated!"
    redirect_to root_path
  end


  private

  def geocode_address (address)
    results = Geocoder.search(address).to_json
    JSON.parse(results)[0]["data"]["geometry"]["location"]
  end

  def location_present?
    if params[:location][:address] == ''
      @happy_hour.errors.add(:address, "can't be blank")
      render :new
    end
  end

end