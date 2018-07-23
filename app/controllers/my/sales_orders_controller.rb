module My
  class SalesOrdersController < ApplicationController
    include MyConcern

    def index
      @sales_orders = current_user.sales_orders.page(params[:page]).per(5)
    end
  end
end
