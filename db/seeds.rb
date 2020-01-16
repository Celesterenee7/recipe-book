
Recipe.destroy_all
FoodTag.destroy_all
Ingredient.destroy_all
10.times do |index|
  FoodTag.create!(name: Faker::Demographic.demonym)
end
20.times do |index|
  count = FoodTag.count
  random_offset = rand(count)
  tag = FoodTag.offset(random_offset).first
  recipe = Recipe.create!(name: Faker::Food.dish,
    instruction: Faker::Lorem.paragraph(sentence_count: 25),
    rating: Faker::Number.between(from: 1, to: 10))
    recipe.food_tags << tag
    10.times do |index|
      Ingredient.create!(name: Faker::Food.ingredient, recipe_id: recipe.id)
    end
  end


  p "Created #{Recipe.count} recipes"


  p "Created #{FoodTag.count} tags"
