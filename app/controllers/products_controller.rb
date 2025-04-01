class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    @product.save
  end

private

def product_params
  params.require(:product).permit(:name, :description, :category, :price, :picture, :status)
end
  end
