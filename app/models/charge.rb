class Charge < ApplicationRecord
  has_many :user_charges

  validates :category, presence: true
  validates :description, presence: true
end
