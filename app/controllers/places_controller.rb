class PlacesController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index]

  def index
    @places = Place.all_to_hash
  end

  def show
    @place = Place.find(params[:id])
    @posts = Post.where(place_id: params[:id])
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
    @place.add_place_images(place_params['place_images_images'])
    @place.update(place_params.except("place_images_images"))
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
