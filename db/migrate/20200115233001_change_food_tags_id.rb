class ChangeFoodTagsId < ActiveRecord::Migration[5.2]
  def change
    rename_column :food_tags_recipes, :food_tags_id, :food_tag_id
  end
end
