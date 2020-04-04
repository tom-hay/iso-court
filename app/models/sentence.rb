class Sentence < ApplicationRecord
  has_one :charge
  has_one :user, through: :charge

  validates :name, presence: true
end
