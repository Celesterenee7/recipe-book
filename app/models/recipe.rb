class Recipe < ApplicationRecord
  has_and_belongs_to_many(:tags)
  has_many :ingredients, dependent: :destroy
  validates :name, presence: true
  validates_length_of :name, maximum: 100
  before_save(:titleize_recipe)

  private
  def titleize_recipe
    self.name = self.name.titleize
  end
end
