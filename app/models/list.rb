class List < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 100}
  validates :description, length: { maximum: 600}
  enum status: { todo: 0, wip: 1, done:2 }
  MAX_LIST_COUNT = 200
  validate :list_count_must_be_within_limit
  
  private 
    def list_count_must_be_within_limit
      errors.add(:base, '投稿数の上限を超えています。') if user.lists.size >= MAX_LIST_COUNT
    end
end
