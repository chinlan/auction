module My
  class CartsController < ApplicationController
    include MyConcern

    def show
      @cart = current_user.cart
      @line_items = @cart&.line_items
    end
  end
end
