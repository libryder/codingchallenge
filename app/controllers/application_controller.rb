class ApplicationController < ActionController::Base
  protect_from_forgery

  def load_challenges
    @five_challenges ||= Challenge.limit(5).all
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end
end
