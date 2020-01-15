require 'rails_helper'

describe Recipe do
  it { should have_many(:ingredients) }
  it { should validate_presence_of :name }
  it { should validate_length_of(:name).is_at_most(100) }
  it("titleizes the name of an recipe") do
   recipe = Recipe.create({name: "pasta meatloaf pie sauce", instruction: "wi sfj sfj"})
   expect(recipe.name()).to(eq("Pasta Meatloaf Pie Sauce"))
 end
 it { should have_and_belong_to_many :tags }
end
