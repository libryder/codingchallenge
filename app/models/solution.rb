class Solution < ActiveRecord::Base
  acts_as_votable
  attr_accessible :challenge_id, :notes, :user_id, :valid_solution, :source, :title
  default_scope order('created_at')
  belongs_to :user
  belongs_to :challenge
  validates :source, presence: true
end
