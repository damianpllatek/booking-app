class Page < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true, length: { minimum: 6, maximum: 250 }
  validates :seo_title, presence: true, length: {minimum: 6, maximum: 250 }
  validates :content, presence: { message: 'Nie może być puste' }, length: { minimum: 10, maximum: 5000 }

  scope :published, -> { where(state: 'published') }
  scope :unpublished, -> { where(state: 'unpublished') }
end
