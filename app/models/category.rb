class Category < ApplicationRecord

  validates :user_id, presence: true

  belongs_to :user
  has_many :tasks

  def self.for_user_id(user_id)
    Category.where(user_id: user_id)
  end
end
