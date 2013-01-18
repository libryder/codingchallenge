class Solution < ActiveRecord::Base
  LANGUAGES = {
    c:          :c_cpp,
    clojure:    :clojure,
    csharp:     :csharp,
    java:       :java,
    javascript: :javascript,
    perl:       :perl,
    php:        :php,
    python:     :python,
    ruby:       :ruby,
    text:       :text
  }

  acts_as_votable
  attr_accessible :challenge_id, :notes, :user_id, :valid_solution, :source, :title, :language
  default_scope order('created_at')
  belongs_to :user
  belongs_to :challenge
  validates :source, :title, presence: true
end
