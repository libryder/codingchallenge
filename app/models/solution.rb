class Solution < ActiveRecord::Base
  attr_accessible :challenge_id, :notes, :solution_url, :user_id, :valid_solution, :notes
  default_scope order('created_at')
  belongs_to :user
  belongs_to :challenge
  validates :solution_url, :notes, presence: true
end
