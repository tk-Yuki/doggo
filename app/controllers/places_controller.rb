class PlacesController < ApplicationController

  def index
    @places_all = Place.all

    @places = []
    @places_all.each do |place|
      @places += [
        id: place.id,
        latitude: place.latitude,
        longitude: place.longitude,
        name: place.name,
        image: Refile.attachment_url(place, :image)
        ]
    end
  end

  def show
    @place = Place.find(params[:id])
  end

  def new
    @user = current_user
    @place = Place.new
  end

  def create
    @place = Place.new(place_params)
    @place.save
    redirect_to places_path
  end

  def edit
    @place = Place.find(params[:id])
  end

  def update
    @place = Place.find(params[:id])
    @place.update(place_params)
    redirect_to places_path
  end

  def destroy
  end

  def place_params
    params.require(:place).permit(:image, :name, :category, :address, :price, :detail)
  end

end
