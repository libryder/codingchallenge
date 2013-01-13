require 'spec_helper'

describe "Challenges" do
  let(:user) { User.make! }
  let!(:challenge) { Challenge.make! }

  describe 'challenges index' do
    before do
      visit_path_and_login_with(challenges_path, user)
    end

    it 'should have button to submit solution' do
      expect(page).to have_link("Submit Solution")
    end

    it 'should navigate to new solution page' do
      click_link("Submit Solution")
      expect(current_path).to eq(new_challenge_solution_path(challenge))
    end

    describe "admin functions" do      
      context 'as an admin' do
        let(:user) { User.make!(:admin) }
        
        it 'should show an edit link' do
          expect(page).to have_link 'Edit'
        end
      end

      context 'as a normal user' do
        it 'does not show edit link' do
          expect(page).to_not have_link 'Edit'
        end
      end
    end

  end

  describe 'show challenge' do
    let(:solution) { Solution.make! }

    before do
      challenge.solutions << solution
      visit_path_and_login_with(challenge_path(challenge), user)
    end

    it 'should show challenge details' do
      expect(page).to have_content(challenge.title)
      expect(page).to have_content(challenge.description)
    end

    it 'should have a link to solutions' do
      expect(page).to have_link('Click to view')
    end

    it 'should navigate to solution' do
      click_link 'Click to view'
      expect(current_path).to eq(challenge_solution_path(challenge, solution))
    end
  end

  describe 'new challenge' do
    let(:user) { User.make!(:admin) }

    before do
      visit_path_and_login_with(new_challenge_path, user)
    end

    describe 'accessing challenges resource' do

      it 'should login successfully' do
        expect(page).to have_content("New challenge")
      end
    end

    describe 'creating new challenge' do
      before do
        fill_in('Title', with: "Some Title")
        fill_in('Gist url', with: 'http://gist.github.com')
        fill_in('Description', with: "A description")
        fill_in('Source', with: "URL to book")
        click_button "Create Challenge"
      end

      it 'should save the correct title' do
        expect(page).to have_content("Some Title")
      end

      it 'should save the correct url' do
        expect(page).to have_content("http://gist.github.com")
      end

      it 'should save the correct description' do
        expect(page).to have_content("A description")
      end

      it 'should save the correct source' do
        expect(page).to have_content('URL to book')
      end
    end
  end
end
