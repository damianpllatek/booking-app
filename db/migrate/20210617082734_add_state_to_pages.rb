class AddStateToPages < ActiveRecord::Migration[6.1]
  def change
    add_column :pages, :state, :string
  end
end
