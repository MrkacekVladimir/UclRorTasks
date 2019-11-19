class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true

  auto_strip_attributes :username, :email ,squish: true

  has_many :categories
  has_many :tags
  has_many :tasks
end
