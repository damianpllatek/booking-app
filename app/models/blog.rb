class Blog < ApplicationRecord
  belongs_to :category
  belongs_to :user

  mount_uploader :photo, PhotoUploader

  validates :title, presence: true, length: { minimum: 6, maximum: 250 }
  validates :seo_title, presence: true, length: {minimum: 6, maximum: 250 }
  validates :content, presence: true, length: { minimum: 10, maximum: 5000 }

  scope :first_scope, -> { where(category: Category.first).where(title: 'test123') }
end
