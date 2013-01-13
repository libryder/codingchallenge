module UserRequestMethods
  def visit_path_and_login_with(path, user)
    visit new_user_session_path
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_button "Sign in"
    visit path
  end
end

RSpec.configure do |config|
  config.include UserRequestMethods, :type => :request
end
