class AddPopularityToSolutions < ActiveRecord::Migration
  def change
    add_column :solutions, :popularity, :integer, default: 1
  end
end
