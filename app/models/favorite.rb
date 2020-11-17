class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :note

  validates :user, presence: true
end
