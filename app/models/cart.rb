class Cart < ApplicationRecord
  belongs_to :user
  has_many :line_items, dependent: :destroy
end

def add_product(product)
  line_items.find_or_initialize_by(product: product).tap do |line_item|
    line_item.quantity ||= 0
    line_item.quantity += 1
  end
end
