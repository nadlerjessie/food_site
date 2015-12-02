class Recipe < ActiveRecord::Base
  has_and_belongs_to_many :categories
  belongs_to :user
  has_many :proportions
  has_many :ingredients, through: :proportions
  has_many :units, through: :proportions
  has_many :steps
end
