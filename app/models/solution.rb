class Solution < ActiveRecord::Base
  attr_accessible :challenge_id, :notes, :solution_url, :user_id, :valid_solution
  
  belongs_to :challenge
  validates :gist_url, :description, presence: true
end
