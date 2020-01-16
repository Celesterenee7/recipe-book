class Ingredient < ApplicationRecord
  scope :sort_name, -> { order(name: :asc) }
  belongs_to :recipe
end
