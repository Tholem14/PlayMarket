class Cart < ApplicationRecord
  belongs_to :user
  has_many :products, through: :line_items
  has_many :line_items, dependent: :destroy

  def add_product(product)
    if line_items.find_by(product: product)
      item = line_items.find_by(product: product)
      item.update(quantity: item.quantity + 1, price: item.price + product.price)
    else
      item = LineItem.create(product: product, cart: self, quantity: 1, price: product.price)
    end
    return item
  end

  def total_price
    self.line_items.sum(&:price)
  end
end
