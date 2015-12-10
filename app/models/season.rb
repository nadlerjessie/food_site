class Season < ActiveRecord::Base
  has_many :state_seasons
  has_many :states, through: :state_seasons
end
