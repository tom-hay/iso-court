class Commitment < ApplicationRecord
  has_many :user_commitments

  validates :category, presence: true
  validates :description, presence: true
end
