class FavoritesController < ApplicationController
  before_action :authenticate_user!

  def create
    @favorite = current_user.favorites.create(
      favorable_type: params[:favorable_type],
      favorable_id: params[:favorable_id]
    )
  end

  def destroy
    @favorite = current_user.favorites.where(
      favorable_type: params[:favorable_type],
      favorable_id: params[:favorable_id]
    ).take
    @favorite.destroy
  end
end
