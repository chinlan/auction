module My
  class FavoritesController < ApplicationController
    include MyConcern

    def index
      @favorites = current_user.favorites.page(params[:page]).per(10)
    end
  end
end
