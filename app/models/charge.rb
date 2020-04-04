class Charge < ApplicationRecord
  belongs_to :user
  has_one :sentence

  validates :category, presence: true
  validates :description, presence: true
end
