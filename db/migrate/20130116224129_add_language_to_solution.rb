class AddLanguageToSolution < ActiveRecord::Migration
  def change
    add_column :solutions, :language, :text
  end
end