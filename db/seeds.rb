# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
require 'open-uri'
require 'json'
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
# Product.destroy_all
user = User.create!(
  email: "jor@gmail.com",
  password: "123456"
)

url = 'https://bymykel.github.io/CSGO-API/api/en/skins.json'
html_doc = URI.open(url).read
products = JSON.parse(html_doc)

products.first(20).each do |product|
  Product.create!(
    name: product["name"],
    description: product["description"],
    category: product["category"]["name"],
    picture: product["image"],
    price: rand(5..500),
    user: user
  )
end

puts "Se crearon #{Product.count} productos exitosamente."
