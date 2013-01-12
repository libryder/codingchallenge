class CreateChallenge < ActiveRecord::Migration
  def up
    create_table :challenges do |t|
      t.text :description
      t.text :gist_url
      t.boolean :valid_solution
      t.integer :up_votes
      t.integer :down_votes
    end
  end

  def down
    drop_table :challenges
  end
end
