module My
  class FavoriteProductsController < ApplicationController
    include MyConcern

    def index
      @favorite_products =
        current_user.favorite_products.page(params[:page]).per(10)
    end
  end
end
