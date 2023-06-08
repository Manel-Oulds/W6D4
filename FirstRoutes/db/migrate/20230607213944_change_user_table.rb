class ChangeUserTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :email
    add_index :users, :name, unique:true
    rename_column :users, :name, :username
    

  end
end
