class ProductsController < ApplicationController

  def index
    @products = Product.all
    @cart = current_user.cart
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      redirect_to products_path(@product)
    else
      render "new", status: :unprocessable_entity
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :picture, :status)
  end
end
