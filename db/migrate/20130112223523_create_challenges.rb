class CreateChallenges < ActiveRecord::Migration
  def change
    create_table :challenges do |t|
      t.text :gist_url
      t.text :description
      t.integer :up_votes
      t.integer :down_votes

      t.timestamps
    end
  end
end
