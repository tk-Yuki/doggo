class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @places_all = Place.all

    @places = []
    @places_all.each do |place|
      @places += [
        id: place.id,
        latitude: place.latitude,
        longitude: place.longitude,
        name: place.name,
        image: Refile.attachment_url(place.place_images[0], :image)
        ]
    end
  end

  def show
    @place = Place.find(params[:id])
    @posts = Post.all
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
    @place = Place.find(params[:id])
    @place.destroy
    redirect_to places_path
  end

  private

  def place_params
    params.require(:place).permit(:name, :category, :address, :price, :detail, place_images_images: [])
  end

end
