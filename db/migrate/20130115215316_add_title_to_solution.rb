class AddTitleToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :title, :text
  end
end
