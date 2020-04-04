class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :charges
  has_many :sentences, through: :charges
  has_many :user_commitments
  has_many :commitments, through: :user_commitments
  has_many :user_groups
  has_many :groups, through: :user_groups

  def setting_total
    commitments.count.to_f + charges.count + sentences.count
  end

  def commitments_score
    score = (commitments.count.to_f / setting_total) * 100
    score.round
  end

  def charges_score
    score = (charges.count.to_f / setting_total) * 100
    score.round
  end

  def sentences_score
    score = (sentences.count.to_f / setting_total) * 100
    score.round
  end
end
