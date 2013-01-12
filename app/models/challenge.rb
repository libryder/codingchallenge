class Challenge < ActiveRecord::Base
  attr_accessible :description, :down_votes, :gist_url, :up_votes, :valid_solution

  has_many :solutions, dependent: :destroy
  validates :description, presence: true
end