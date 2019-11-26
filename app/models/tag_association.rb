class TagAssociation < ApplicationRecord

  validates :tag_id, presence: true
  validates :task_id, presence: true

  belongs_to :tag
  belongs_to :task
end
