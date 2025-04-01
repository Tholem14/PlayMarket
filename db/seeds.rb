# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# User.destroy_all
# Product.destroy_all
# Cart.destroy_all
# LineItem.destroy_all
# User.create!(email: "alvarezdetoledo14@gmail.com", password:"4484234a47")
# User.create!(email: "asdasd@hotmail.com", password:"44848141a47")
# Product.create!(user: User.last, name:"AK", price: 123)
# Cart.create!(user: User.first)
# LineItem.create!(cart: Cart.first, product: Product.first)
