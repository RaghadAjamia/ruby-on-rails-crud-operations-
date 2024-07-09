class LocationsController < ApplicationController
 def index
    @locations = Location.all
  end

  def show
    @location = Location.find(params[:id])
  end

  def new
  end
  def update
    location = Location.find(params[:id])
    location.update(location_params)
    
    redirect_to locations_path
 end
 
 def userloc
  @locations = Location.all
end
  def edit
    @location = Location.find(params[:id])
 end
  def create
    location = Location.new(location_params)
    location.save
    redirect_to locations_path
  end
  private
  def location_params
    params.require(:location).permit(:address,)
  end
end
