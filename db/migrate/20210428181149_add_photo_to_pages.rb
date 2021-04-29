class AddPhotoToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :photo, :string
  end
end
