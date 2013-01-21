require 'spec_helper'

describe "Users" do
  let(:user) { User.make! }
  let(:twitter_user) { User.make!(:twitter) }
  let(:github_user) { User.make!(:github) }
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

  describe 'access to the right resources' do
    context 'as a regular user' do
      let!(:user) { User.make! }
      let!(:user2) { User.make! }

      it 'should not be able to access another users edit page' do
        visit_path_and_login_with(edit_user_path(user2), user)
        expect(current_path).to_not eq(edit_user_path(user2))
      end

      it 'should be able to access their own edit page' do
        visit_path_and_login_with(edit_user_path(user), user)
        expect(current_path).to eq(edit_user_path(user))
      end
    end

    context 'as an admin' do
      let!(:user) { User.make!(:admin) }
      let!(:user2) { User.make! }

      it 'should be able to access a different edit user page' do
        visit_path_and_login_with(edit_user_path(user2), user)
        expect(current_path).to eq(edit_user_path(user2))
      end
    end
  end
end