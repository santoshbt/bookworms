class Review < ApplicationRecord
  belongs_to :user
  belongs_to :book

  validates :title, presence: true

  has_many :comments, as: :commentable, dependent: :destroy

  default_scope { order(updated_at: :desc) }
end
