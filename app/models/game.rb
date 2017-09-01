class Game < ApplicationRecord
  has_many :matches
  has_many :teams, through: :matches
  has_many :availabilities
  scope :chronological, -> { order(:date) }
end
