class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, presence: true
  validates :username, presence: true

  auto_strip_attributes :email, squish: true

  has_many :categories, dependent: :delete_all
  has_many :tags, dependent: :delete_all
  has_many :tasks, dependent: :delete_all

  def self.for_user_id(user_id)
    Tag.where(user_id: user_id)
  end
end
