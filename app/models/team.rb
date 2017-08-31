class Team < ApplicationRecord
  belongs_to :user, optional: true
  has_many :matches
  has_many :memberships
  has_many :players, through: :memberships
  has_many :games, through: :matches
end



