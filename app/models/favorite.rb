# == Schema Information
#
# Table name: favorites
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Favorite < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :user
  delegate :categories, to: :recipe
end
