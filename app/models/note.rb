class Note < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  # accepts_nested_attributes_for :images, allow_destroy: true
  validates :title, :status, :subject, :text ,presence: true
  validates :images, presence: true
end