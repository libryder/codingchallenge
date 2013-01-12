class Challenge < ActiveRecord::Base
  has_many :solutions, dependent: :destroy
  validates :gist_url, :description, presence: true
end