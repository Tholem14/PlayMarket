class Product < ApplicationRecord
  belongs_to :user
  has_many :line_items
  has_one_attached :photo

  scope :filter_by_name, ->(query) { where("name ILIKE ?", "%#{query}%") if query.present? }
  scope :filter_by_category, ->(category) { where(category: category) if category.present? }

  def self.search(query, category)
    filter_by_name(query).filter_by_category(category)
  end
end
