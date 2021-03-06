class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :text, presence: true
  validates :user, presence: true
end
