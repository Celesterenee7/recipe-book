class Recipe < ApplicationRecord
  scope :top_rated, -> { where("rating > ?", 8) }
  scope :sort_tags, -> {(
  select("recipes.id, recipes.name, food_tags.id")
  .joins(:food_tags)
  .group("recipes.id")
  .limit(10)
  )}
  has_and_belongs_to_many(:food_tags)
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_recipe)

  private
  def titleize_recipe
    self.name = self.name.titleize
  end
end
