require 'spec_helper'

describe "Users" do
  let(:user) { User.make! }
  before { Challenge.make! }

  describe 'signing in with oauth' do
    describe 'through github' do
      pending 'github oauth tests'
    end

    describe 'through twitter' do
      pending 'twitter oauth tests'
    end
  end

  describe 'signing out' do
    before { visit_path_and_login_with(root_path, user) }
    
    it 'should let you sign out and display signout flash' do
      click_link "Sign out"
      expect(page).to have_content('Signed out successfully.')
    end
  end
end