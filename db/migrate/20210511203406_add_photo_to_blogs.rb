class AddPhotoToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :photo, :string
  end
end
