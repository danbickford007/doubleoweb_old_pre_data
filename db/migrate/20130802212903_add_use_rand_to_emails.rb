class AddUseRandToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :use_rand, :boolean
  end
end
