class Category < ApplicationRecord

  validates :user_id, presence: true

  belongs_to :user
  has_many :tasks
end
