class PlaceImagesController < ApplicationController
  def destroy
    @place_image = PlaceImage.find(params[:id])
    @place_image.destroy
    redirect_to edit_place_path(@place_image.place)
  end
end
