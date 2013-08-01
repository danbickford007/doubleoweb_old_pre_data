class AddTypeToCategories < ActiveRecord::Migration
  def change
    add_column :categories, :post_type, :string
  end
end
