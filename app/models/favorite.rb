class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  delegate :categories, to: :recipe
end
