class AddStateToBlogs < ActiveRecord::Migration[6.1]
  def change
    add_column :blogs, :state, :string
  end
end
