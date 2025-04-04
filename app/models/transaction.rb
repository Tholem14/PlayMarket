class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :order

  validates :amount, numericality: { greather_than: 0 }
  validates :status, inclusion: { in: %w[pending completed failded refunded] }
end
