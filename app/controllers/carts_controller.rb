  require 'mercadopago'

class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart = current_user.cart
  end

  def payment
    @cart = current_user.cart
  end

  def destroy
    @cart.destroy
    session[:cart_id] = nil
    redirect_to products_path, notice: "Se vacio el carrito."
  end

  def destroy_item
    @cart = @line_item.cart
    @line_item.destroy
    redirect_to cart_path(@cart), notice: 'Juego eliminado del carrito.'
  end

  private

  def set_cart
    @cart = Cart.find_or_create_by(id: session[:cart_id])
    session[:cart_id] = @cart.id
  end
end
