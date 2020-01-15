class AddColumnToRecipes < ActiveRecord::Migration[5.2]
  def change
    add_column(:recipes, :name, :string)
    add_column(:recipes, :instruction, :string)
    add_column(:recipes, :rating, :integer)
  end
end
