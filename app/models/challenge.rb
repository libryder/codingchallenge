class Challenge < ActiveRecord::Base
  attr_accessible :description, :down_votes, :gist_url, :up_votes, :valid_solution, :title, :source, :solutions_attributes

  has_many :solutions, dependent: :destroy
  validates :description, presence: true

  accepts_nested_attributes_for :solutions, allow_destroy: true
end