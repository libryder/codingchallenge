class Solution < ActiveRecord::Base
  belongs_to :challenge
  validates :gist_url, :description, presence: true
end