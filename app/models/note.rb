class Note < ApplicationRecord
  belongs_to :user
  has_many_attached :images, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  validates :title, :status, :subject, :text ,presence: true
  validates :images, presence: true

  def self.search(search)
    return Note.all unless search
    Note.where('text LIKE(?)', "%#{search}%")
  end
end