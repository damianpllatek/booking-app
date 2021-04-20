class AddSeoTitleToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :seo_title, :string
  end
end
