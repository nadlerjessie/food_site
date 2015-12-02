# == Schema Information
#
# Table name: proportions
#
#  id            :integer          not null, primary key
#  unit_id       :integer
#  ingredient_id :integer
#  quantity      :float
#  recipe_id     :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

require 'test_helper'

class ProportionTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
