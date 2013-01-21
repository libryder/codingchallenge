class ChallengeExpiry < ActiveModel::Validator
  attr_accessor :record

  def validate(record)
    if record.expired?
      record.errors[:Challenge] << 'Challenge has expired.'
    end
  end
end

class Challenge < ActiveRecord::Base
  include ActiveModel::Validations
  validates_with ChallengeExpiry

  attr_accessible :description, :down_votes, :gist_url, :up_votes, :title, :source, :solutions_attributes, :created_at

  has_many :solutions, dependent: :destroy
  validates :description, presence: true

  accepts_nested_attributes_for :solutions, allow_destroy: true
  
  def expired?
    created = created_at || Time.now
    elapsed = Time.now.to_i - created.to_i
    elapsed > 7.days.to_i
  end
end