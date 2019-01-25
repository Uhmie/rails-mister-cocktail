require 'json'
require 'open-uri'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'
items_serialized = open(url).read
items = JSON.parse(items_serialized)

items['drinks'].each do |item|
  p item['strIngredient1']
  Ingredient.create(name: item['strIngredient1'])
end

25.times do
  Cocktail.create(name: Faker::Coffee.blend_name)
end
