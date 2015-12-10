class State < ActiveRecord::Base
  has_many :state_seasons
  has_many :seasons, through: :state_seasons
end
