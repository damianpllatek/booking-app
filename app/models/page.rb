class Page < ApplicationRecord
  mount_uploader :photo, PhotoUploader

  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :seo_title, presence: true, length: {minimum: 6, maximum: 50 }
  validates :content, presence: { message: 'Nie może być puste' }, length: { minimum: 10, maximum: 300 }
end
