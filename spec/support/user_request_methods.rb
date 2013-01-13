module UserRequestMethods
  def visit_path_and_login_with(path, user)
    visit path
    fill_in "user_email", :with => user.email
    fill_in "user_password", :with => user.password
    click_button "Sign In"

    # There's a spot in the codebase where I need to log in and jump to a page
    # that doesn't have the layout. This is a helpful check, but it is not
    # absolutely required.
    if page.has_selector?("#flash-messages")
      expect(page).to have_content("Signed in successfully")
    end
  end
end

RSpec.configure do |config|
  config.include UserRequestMethods, :type => :request
end
