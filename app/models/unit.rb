# == Schema Information
#
# Table name: units
#
#  id           :integer          not null, primary key
#  name         :string
#  abbreviation :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Unit < ActiveRecord::Base
  has_many :proportions
end
