class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one_attached :avatar
  has_many :user_charges
  has_many :charges, through: :user_charges
  has_many :sentences, through: :charges
  has_many :user_commitments
  has_many :commitments, through: :user_commitments
  has_many :user_groups
  has_many :groups, through: :user_groups
end
