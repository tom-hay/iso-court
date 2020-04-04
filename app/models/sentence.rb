class Sentence < ApplicationRecord
  has_many :user_sentences

  validates :name, presence: true
end
