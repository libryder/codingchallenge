class CreateSolutions < ActiveRecord::Migration
  def change
    create_table :solutions do |t|
      t.text :solution_url
      t.integer :challenge_id
      t.integer :user_id
      t.boolean :valid_solution
      t.text :notes

      t.timestamps
    end
  end
end
