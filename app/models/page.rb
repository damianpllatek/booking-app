class Page < ApplicationRecord
  # def run_counter 
    # Metoda 1
    # @page.views += 1
    # @page.save

    # Metoda 2
    # update(views: self.views += 1)
  # end

  validates :title, presence: true, length: { minimum: 6, maximum: 50 }
  validates :seo_title, presence: true, length: {minimum: 6, maximum: 50 }
  validates :content, presence: true, length: { minimum: 10, maximum: 300 }
  validates :views, presence: true
end
