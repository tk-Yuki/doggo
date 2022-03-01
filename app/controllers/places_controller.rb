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
    # 既存の画像のお尻に新たらしくアップロードされた画像群を追加する
    place_image_params = place_params["place_images_images"]
    place_image_params.shift
    place_image_params.each do |place_image_param|
      pi = PlaceImage.new
      pi.image = place_image_param
      @place.place_images << pi
    end
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
