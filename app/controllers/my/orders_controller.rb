module My
  class OrdersController < ApplicationController
    include MyConcern

    def index
      @orders = current_user.orders.page(params[:page]).per(5)
    end

    def show
      @order = current_user.orders.find params[:id]
    end
  end
end
