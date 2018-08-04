module My
  class FavoriteSellersController < ApplicationController
    include MyConcern

    def index
      @favorite_sellers =
        current_user.favorite_sellers.page(params[:page]).per(10)
    end
  end
end
