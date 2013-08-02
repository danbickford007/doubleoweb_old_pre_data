class ChangeContentDatatype < ActiveRecord::Migration
  def change
    change_column :posts, :content, :text, :limit => 16777216
  end
end
