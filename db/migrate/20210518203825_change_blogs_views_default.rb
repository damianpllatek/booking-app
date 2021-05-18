class ChangeBlogsViewsDefault < ActiveRecord::Migration[6.1]
  def change
    change_column_default :blogs, :views, 0
  end
end
