# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Recipe.destroy_all
FoodTag.destroy_all
Ingredient.destroy_all
10.times do |index|
  FoodTag.create!(name: Faker::Verb.past)
end
50.times do |index|
   tag = FoodTag.first
  recipe = Recipe.create!(name: Faker::Food.dish,
    instruction: Faker::Lorem.sentence(20, false, 0).chop,
    rating: Faker::Number.between(from: 1, to: 10))
    recipe.food_tags << tag
    10.times do |index|
      Ingredient.create!(name: Faker::Food.ingredient, recipe_id: recipe.id)
    end
  end


  p "Created #{Recipe.count} recipes"


  p "Created #{FoodTag.count} tags"
