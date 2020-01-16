class Recipe < ApplicationRecord
  scope :top_rated, -> { where("rating > ?", 6) }
  scope :five_recent, -> { order(created_at: :desc).limit(5)}
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
