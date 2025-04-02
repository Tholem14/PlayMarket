class LineItem < ApplicationRecord
  belongs_to :cart
  belongs_to :product
  belongs_to :order, optional: true

  validates :cart_id, :product_id, presence: true
  validates :quantity, numericality: { greater_than: 0}

  def total_price
    product.price * quantity
  end;

end
