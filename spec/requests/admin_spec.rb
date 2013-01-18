require 'spec_helper'

describe "Admin" do

  let(:user) { User.make!(:admin) }
  let(:challenge) { Challenge.make! }

  it "should display the user admin page" do
    visit_path_and_login_with(admin_challenges_path, user)
    pending 'fix activeadmin!'
    #expect(page).to have_content(challenge.title)
  end

end