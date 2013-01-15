class AddSourceToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :source, :text
  end

  def down
    remove_column :solutions, :source
  end
end
