class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.binary :content
      t.integer :owner_id
      t.integer :city_id
      t.references :postable, :polymorphic => true
      t.timestamps
    end
  end
end
