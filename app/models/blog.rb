class Blog < ApplicationRecord
  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :seo_title, presence: true, length: {minimum: 6, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 300 }
  validates :views, presence: true
end
