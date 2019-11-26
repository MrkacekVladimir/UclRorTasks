class Task < ApplicationRecord

  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  belongs_to :category
  has_many :tag_associations
  has_many :tags, through: :tag_associations
end
