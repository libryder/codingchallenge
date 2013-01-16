module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def display_user(user)
    return "" if user.nil?
    return user.email if user.provider.nil?

    case user.provider.downcase
      when "twitter" then link_to("@#{user.username}", "http://www.twitter.com/#{user.username}/>#{user.username}")
      when "github"  then link_to(user.username, "http://www.github.com/#{user.username}/>#{user.username}")      
      else user.username 
    end
  end
end