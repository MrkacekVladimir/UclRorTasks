class Task < ApplicationRecord
  validates :title, :deadline_at, :note, presence: true
  validates :is_done, inclusion: {in: [true, false]}

  belongs_to :user
  belongs_to :category, optional: true
  has_many :tag_associations, dependent: :destroy
  has_many :tags, through: :tag_associations

  def self.for_user_id(user_id)
    where(user_id: user_id)
  end

  def self.apply_filter(task_filter)
    query = all

    unless task_filter.nil?
      query = query.where("title LIKE :term", term: "%#{task_filter.search_term}%") unless task_filter.search_term.blank?
      query = query.where(is_done: false) if task_filter.only_unfinished
      query = query.where(category_id: task_filter.category_ids) unless task_filter.category_ids.count == 0
      query = query.includes(:tags).where(tags: { id: task_filter.tag_ids }) unless task_filter.tag_ids.count == 0
    end

    query
  end
end
