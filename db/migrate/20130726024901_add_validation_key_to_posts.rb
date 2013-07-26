class AddValidationKeyToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :validation_key, :string
  end
end
