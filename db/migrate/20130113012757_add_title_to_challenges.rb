class AddTitleToChallenges < ActiveRecord::Migration
  def change
    add_column :challenges, :title, :text
  end
end
