class List < ApplicationRecord
  belongs_to :user
  validates :title, length: { maximum: 100}
  validates :description, length: { maximum: 600}
  enum status: { todo: 0, wip: 1, done:2 }
end
