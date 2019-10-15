class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :family_name, presence: true
  validates :name, presence: true
  validates :family_kana, presence: true
  validates :first_kana, presence: true
  validates :email, presence: true
  validates :password, presence: true
  has_many :videos
  has_many :favorites, dependent: :destroy
  # scope :active,where(is_quit:false)
end
