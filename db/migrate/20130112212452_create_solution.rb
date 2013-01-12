class CreateSolution < ActiveRecord::Migration
  def up
    create_table :solutions do |t|
      t.text :description
      t.text :gist_url
      t.boolean :valid_solution
      t.integer :challenge_id
      t.timestamps
    end
  end

  def down
    drop_table :solutions
  end
end
