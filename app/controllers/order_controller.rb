class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = current_user.cart
    if @cart.line_items.empty?
      redirect_to cart_path, alert: "El carrito está vacío."
      return
    end

    @order = Order.create_from_cart(@cart, current_user)
    if @order.persisted?
      @cart.line_items.destroy_all # Vacía el carrito
      redirect_to order_path(@order), notice: "Compra exitosa."
    else
      redirect_to cart_path, alert: "Error al procesar la compra."
    end
  end
end
