class ChangeTagsTableName < ActiveRecord::Migration[5.2]
  def change
    rename_table :tags, :food_tags
    drop_table  :recipes_tags

  create_table :recipes_food_tags, id: false do |t|
      t.belongs_to :food_tags, index: true
      t.belongs_to :recipe, index: true
    end
  end
end
