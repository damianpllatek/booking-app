class CreateBlogs < ActiveRecord::Migration[6.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.string :seo_title
      t.text :content
      t.integer :views

      t.timestamps
    end
  end
end
