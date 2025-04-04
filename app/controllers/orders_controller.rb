class OrdersController < ApplicationController
  before_action :authenticate_user!

  def create
    @cart = current_user.cart
    @order = Order.create_from_cart(@cart, current_user)

    if @order.persisted?
      Transaction.create!(
        user: current_user,
        order: @order,
        amount: @order.total,
        status: 'completed'
      )
      @cart.line_items.destroy_all
      redirect_to transactions_path, notice: "¡Compra exitosa!"
    else
      redirect_to cart_path, alert: "Error: #{@order.errors.full_messages.to_sentence}"
    end
  end
end
