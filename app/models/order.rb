class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy

  validates :total, presence: true
  validates :status, inclusion: { in: %w[pending completed cancelled] }

  def self.create_from_cart(cart, user)
    order = user.orders.new(
      total: cart.total_price,
      status: 'pending'
    )

    cart.line_items.each do |item|
      order.line_items << item.dup # Duplica los ítems del carrito al pedido
    end

    order.save!
    order
  end
end
