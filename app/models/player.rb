class Player < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :availabilities
  has_many :games, through: :teams
end
