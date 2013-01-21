module ApplicationHelper
  def present(object, klass = nil)
    klass ||= "#{object.class}Presenter".constantize
    presenter = klass.new(object, self)
    yield presenter if block_given?
    presenter
  end

  def display_user(user, challenge)
    if challenge.expired?
      link_to(user.username, user_path(user))
    else
      "Clever User"
    end
  end

  def display_language(solution)
    icon = Solution::LANGUAGES[solution.language.to_sym]
    return solution.language if icon.blank?

    tag = image_tag("#{icon}_logo.png", class: 'header-logo', title: solution.language)

    "#{tag} #{solution.language}"
  end
end