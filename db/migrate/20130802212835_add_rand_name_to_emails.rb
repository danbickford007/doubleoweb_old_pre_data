class AddRandNameToEmails < ActiveRecord::Migration
  def change
    add_column :emails, :rand_name, :string
  end
end
