class Solution < ActiveRecord::Base
  LANGUAGES = {
    ruby:       :ruby,
    c:          :c_cpp,
    clojure:    :clojure,
    csharp:     :csharp,
    java:       :java,
    javascript: :javascript,
    perl:       :perl,
    php:        :php,
    python:     :python,
    text:       :text
  }

  acts_as_votable
  attr_accessible :challenge_id, :user_id, :valid_solution, :source, :title, :language, :popularity
  scope :by_popularity, lambda { order('popularity desc') }
  scope :valid, where(valid_solution: true)
  belongs_to :user
  belongs_to :challenge
  validates :source, :title, presence: true

  def calculate_popularity!
    update_attributes(popularity: (up_votes.count - down_votes.count) + 1)
  end
end
