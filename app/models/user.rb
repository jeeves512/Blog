class User < ApplicationRecord
  # Include default devise modules. Others available are:
  has_many :publication_users
  has_many :publications, through: :publication_users
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :articles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
