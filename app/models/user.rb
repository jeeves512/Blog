class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :articles
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
