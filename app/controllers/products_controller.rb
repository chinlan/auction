class ProductsController < ApplicationController
  before_action :find_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show]

  def index
    @products = Product.with_status(:published)
                       .page(params[:page]).per(5)
  end

  def show
  end

  def new
    @product = current_user.products.build
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to products_path
    else
      render :new
    end
  end

  def edit
    raise unless current_user == @product.seller
  end

  def update
    raise unless current_user == @product.seller
    if @product.update(product_params)
      redirect_to products_path
    else
      render :edit
    end
  end

  def destroy
    raise unless current_user == @product.seller
    @product.destroy
    redirect_to products_path
  end

  private

  def find_product
    @product = Product.with_uid(params[:id]).take
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :status, :number)
  end
end
