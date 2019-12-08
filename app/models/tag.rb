class Tag < ApplicationRecord

  validates :title, presence: true
  validates :user_id, presence: true

  belongs_to :user
  has_many :tag_associations, dependent: :destroy
  has_many :tasks, through: :tag_associations

  def self.for_user_id(user_id)
    Tag.where(user_id: user_id)
  end
end
