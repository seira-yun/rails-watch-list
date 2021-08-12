class Bookmark < ApplicationRecord
  belongs_to :movie
  belongs_to :list
  validates :movie, presence: true, uniqueness: { scope: :list }
  # validates :list, presence: true
  validates :comment, length: {
    minimum: 6,
    too_short: '%{count} characters is the minimum allowed'
  }
end
