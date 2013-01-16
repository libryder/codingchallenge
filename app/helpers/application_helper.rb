module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def display_user(user)
    if user.nil? then "anonymous"
    elsif user.uid.nil? then user.email
    elsif user.provider.downcase == "twitter"
      link_to("@#{user.username}", "http://www.twitter.com/#{user.username}")
    elsif user.provider.downcase == "github"
      link_to(user.username, "http://www.github.com/#{user.username}")
    end
  end
end