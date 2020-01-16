class ChangeFoodTagsName < ActiveRecord::Migration[5.2]
  def change
    rename_table :recipes_food_tags, :food_tags_recipes
  end
end
