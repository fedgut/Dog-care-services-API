class FavouritesController < ApplicationController
  def index
    @favourite = Favourite.where('user_id = ?', params[:user_id])
    json_response(@favourite)
  end

  def create
    @favourite = current_user.favourites.create!(favourite_params)
    json_response(@favourite, :created)
  end

  def destroy
    set_favourite
    @favourite.destroy
  end

  private

  def favourite_params
    params.permit(:user_id, :service_id)
  end

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
