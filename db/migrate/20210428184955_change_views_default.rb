class ChangeViewsDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :pages, :views, 0
  end
end
