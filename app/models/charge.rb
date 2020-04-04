class Charge < ApplicationRecord
  has_many :user_charges
  has_one :sentence

  validates :category, presence: true
  validates :description, presence: true
end
