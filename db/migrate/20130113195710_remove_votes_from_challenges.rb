class RemoveVotesFromChallenges < ActiveRecord::Migration
  def up
    remove_column :challenges, :up_votes
    remove_column :challenges, :down_votes
  end

  def down
  end
end
