class FoodTag < ApplicationRecord
  scope :recently_added, -> { where("created_at > ?", 1.day.ago) }
  has_and_belongs_to_many(:recipes)
end
