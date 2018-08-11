module Products
  class SearchController < ApplicationController
    def index
      @products = Product.search(params[:keyword],
                 fields: ['name', 'description']),
                 operator: 'or',
                 page: params[:page], per_page: 20
      redirect_to root_path
    end
  end
end
