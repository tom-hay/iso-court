class Charge < ApplicationRecord
  has_many :user_charges

  validates :type, presence: true
  validates :description, presence: true
end
