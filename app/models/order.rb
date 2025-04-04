class Order < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_one :Transaction, dependent: :destroy

  validates :total, presence: true
  validates :status, inclusion: { in: %w[pending completed cancelled] }

  order = Order.new(total: 99.99, user: User.first, status: 'completed') # Añade status
  order.save!

private
  def update_stock_and_log_transaction
  line_items.each do |item|
    item.product.decrement!(:stock, item.quantity)
    end
  end
end
