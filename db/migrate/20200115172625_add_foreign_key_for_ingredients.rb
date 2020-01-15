class AddForeignKeyForIngredients < ActiveRecord::Migration[5.2]
  def change
    add_foreign_key :ingredients, :recipes
  end
end
