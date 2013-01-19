class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :load_challenges

  def load_challenges
    @five_challenges ||= Challenge.limit(5).all
  end

  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    klass.new(object, view_context)
  end

  def authenticate_admin_user!
    render_403 and return if user_signed_in? && !current_user.admin?
    authenticate_user!
  end
  
  def current_admin_user
    return nil if user_signed_in? && !current_user.admin?
    current_user
  end
end
