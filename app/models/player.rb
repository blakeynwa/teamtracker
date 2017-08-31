class Player < ApplicationRecord
  has_many :memberships
  has_many :teams, through: :memberships
  has_many :availabilities
end
