class LineItemsController < ApplicationController
  before_action :set_cart, only: [:create]
  before_action :set_line_item, only: [:update, :destroy]

  def create
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product)

    respond_to do |format|
      if @line_item.save
        format.html { redirect_to cart_path(@cart), notice: 'Juego agregado al carrito.' }
        format.js
      else
        format.html { redirect_to product, alert: 'No se pudo agregar al carrito.' }
      end
    end
  end

  def update
    if @line_item.update(line_item_params)
      redirect_to cart_path(@line_item.cart), notice: 'Cantidad actualizada.'
    else
      redirect_to cart_path(@line_item.cart), alert: 'Error al actualizar.'
    end
  end

  def destroy
    @cart = @line_item.cart
    @line_item.destroy
    redirect_to cart_path(@cart), notice: 'Juego eliminado del carrito.'
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:quantity, :product_id)
  end
end
