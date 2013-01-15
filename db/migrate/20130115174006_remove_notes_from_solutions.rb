class RemoveNotesFromSolutions < ActiveRecord::Migration
  def up
    remove_column :solutions, :notes
  end

  def down
    add_column :solutions, :notes, :string
  end
end
