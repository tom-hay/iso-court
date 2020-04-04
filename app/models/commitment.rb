class Commitment < ApplicationRecord
  has_many :user_commitments

  validates :type, presence: true
  validates :description, presence: true
end
