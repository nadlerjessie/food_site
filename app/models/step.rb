# == Schema Information
#
# Table name: steps
#
#  id          :integer          not null, primary key
#  description :string
#  recipe_id   :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Step < ActiveRecord::Base
  belongs_to :recipe
  validates_presence_of :description
end
