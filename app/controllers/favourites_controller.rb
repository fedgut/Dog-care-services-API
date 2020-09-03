class FavouritesController < ApplicationController
  def index
    @favourite = Favourite.where('user_id = ?', params[:user_id])
    json_response(@favourite)
  end

  def destroy
    set_favourite
    @favourite.destroy
  end

  private

  def set_favourite
    @favourite = Favourite.find(params[:id])
  end
end
