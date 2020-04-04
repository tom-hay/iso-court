class Sentence < ApplicationRecord
  belongs_to :charge
  has_one :user, through: :charge

  validates :name, presence: true
end
