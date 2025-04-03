class Product < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_one_attached :photo
end

