class Category < ApplicationRecord
  has_many :blogs
  
  validates :name, presence: true, length: { minimum: 3, maximum: 50 }
end
