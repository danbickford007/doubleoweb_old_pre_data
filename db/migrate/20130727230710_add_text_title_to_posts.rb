class AddTextTitleToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :text_title, :text
  end
end
