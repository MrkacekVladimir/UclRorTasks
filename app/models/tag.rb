class Tag < ApplicationRecord

  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :tag_associations
  has_many :tasks, through: :tag_associations
end
