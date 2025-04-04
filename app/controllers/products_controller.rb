class ProductsController < ApplicationController

  def index
    @products = Product.all
    @cart = current_user.cart
    if params[:query].present?
      @products = @products.where("name ILIKE ?", "%#{params[:query]}%")
    end
    if params[:query].present?
      @products = @products.where("name ILIKE ?", "%#{params[:query]}%")
    end
    @products = Product.search(params[:query], params[:category])
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

  def destroy
    @product = Product.find(params[:id])

    if @product.line_items.exists?
      redirect_to products_path, alert: "You cannot delete this product because it is in use."
    else

    if @product.user_id == current_user.id
      @product.destroy

      respond_to do |format|
        format.turbo_stream
        format.html { redirect_to products_path, notice: "Producto eliminado correctamente." }
      end
    else
      redirect_to products_path, alert: "No tienes permiso para eliminar este producto."
    end
    end
  end

private

  def product_params
    params.require(:product).permit(:name, :description, :category, :price, :picture, :status, :photo)
  end
end
