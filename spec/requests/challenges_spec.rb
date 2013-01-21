require 'spec_helper'

describe "Challenges" do

  let!(:user) { create_logged_in_user }
  let!(:challenge) { Challenge.make! }

  describe 'challenges index' do
    before do
      visit challenge_path(challenge)
    end

    it 'should have button to submit solution' do
      expect(page).to have_link("Submit Solution")
    end

    describe "admin functions" do      
      context 'as an admin' do
        let!(:user) { create_logged_in_admin }
        
        before { visit challenges_path }
        
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

  describe 'resource security' do
    let(:challenge) { Challenge.make! }

    context 'as an admin' do
      let!(:user) { create_logged_in_admin }

      it 'should be able to access edit page' do
        visit edit_challenge_path(challenge)
        expect(current_path).to eq(edit_challenge_path(challenge))
      end

      it 'should be able to access the new page' do
        visit new_challenge_path
        expect(current_path).to eq(new_challenge_path)
      end
    end

    context 'as a regular user' do
      let!(:user) { create_logged_in_user }

      it 'should not allow access to edit page' do
        visit edit_challenge_path(challenge)
        expect(current_path).to eq(root_path)
      end

      it 'should not be able to access the new page' do
        visit new_challenge_path
        expect(current_path).to eq(root_path)
      end
    end
  end


  describe 'show challenge' do
    let(:solution) { Solution.make! }

    before do
      challenge.solutions << solution
      visit challenge_path(challenge)
    end

    it 'should show challenge details' do
      expect(page).to have_content(challenge.title)
      expect(page).to have_content(challenge.description)
    end

    it 'should navigate to solution' do
      click_link solution.title
      expect(current_path).to eq(challenge_solution_path(challenge, solution))
    end
  end

  describe 'new challenge' do
    let!(:user) { create_logged_in_admin }

    before do
      visit new_challenge_path
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
