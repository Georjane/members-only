class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :posts

  validates :username, presence: true, uniqueness: true, length: { in: 3..10 }
  validates :email, presence: true, uniqueness: { case_sensitive: false }, format: /\w+@\w+\.{1}[a-zA-Z]{2,}/
  validates :password, presence: true, length: { in: 5..15 }
end
