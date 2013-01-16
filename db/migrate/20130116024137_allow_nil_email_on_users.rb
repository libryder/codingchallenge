class AllowNilEmailOnUsers < ActiveRecord::Migration
  def up
    change_column :users, :email, :string, null: true, default: nil
    remove_index :users, :email
  end

  def down
  end
end
