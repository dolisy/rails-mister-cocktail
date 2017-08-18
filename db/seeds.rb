# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'open-uri'
require 'json'

puts "claning db..."
Dose.destroy_all
Cocktail.destroy_all
Ingredient.destroy_all

puts "getting JSON ingredient..."
ingredients = JSON.parse(open("http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list").read)


puts "creating ingredients..."
ingredients["drinks"].each do |ingredient_hash|
  Ingredient.create(name: ingredient_hash["strIngredient1"])
end

Ingredient.all.each do |ingredient|
  p ingredient
end

puts "creating cocktails..."
i = 1
10.times do
  Cocktail.create(name: "seed cocktail #{i}")
  i += 1
end

Cocktail.all.each do |cocktail|
  p cocktail
end

puts "creating doses..."
20.times do
  Dose.create(description: "***********", cocktail: Cocktail.order("RANDOM()").limit(1).first(), ingredient: Ingredient.order("RANDOM()").limit(1).first()  )
end

Dose.all.each do |dose|
  p dose
end
