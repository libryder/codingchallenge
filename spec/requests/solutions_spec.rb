require 'spec_helper'

describe "Solutions" do
  let(:user) { User.make! }
  let(:challenge) { Challenge.make! }
  let(:solution) { Solution.make!(challenge: challenge) }
  after { DatabaseCleaner.clean }

  describe 'resource security' do
    context 'as an admin' do
      let!(:user) { create_logged_in_admin }

      it 'should be able to access edit page' do
        visit edit_challenge_solution_path(challenge, solution)
        expect(current_path).to eq(edit_challenge_solution_path(challenge, solution))
      end
    end

    context 'as a regular user' do
      let!(:user) { create_logged_in_user }

      it 'should not allow access to edit page' do
        visit edit_challenge_solution_path(challenge, solution)
        expect(current_path).to eq(root_path)
      end

      it 'should be able to access the new page' do
        visit new_challenge_solution_path(challenge)
        expect(current_path).to eq(new_challenge_solution_path(challenge))
      end
    end

    context 'logged out' do
      let(:user) { nil }

      it 'should not be able to access new page' do
        visit new_solution_path
        expect(current_path).to eq(new_user_session_path)
      end
    end
  end

  describe 'solutions list page' do
    before do
      challenge.solutions << solution
      visit challenge_solutions_path(challenge)
    end
    
    describe 'voting mechanism', :js, :vcr do
      it 'should not allow you to when not logged in' do
        expect(page).to_not have_css('.icon-circle-arrow-up')
      end

      let!(:user) { create_logged_in_user }
      context 'when logged in' do
        before { visit challenge_path(challenge) }

        it 'should allow you to up vote' do
          arrow = "up_vote_#{solution.id}"
          click_link arrow
          visit current_path
          expect(page.find_link(arrow)[:class]).to have_content('icon-circle-arrow-up')
        end

        it 'should allow you to down vote' do
          arrow = "down_vote_#{solution.id}"
          click_link arrow
          visit current_path
          expect(page.find_link(arrow)[:class]).to have_content('icon-circle-arrow-down')
        end

        it 'should display the correct count' do
          element = page.find('.vote-count .count')
          expect(element.text).to eq("1")
        end

        it 'should increment the count' do
          element = page.find('.vote-count .count')
          arrow = "up_vote_#{solution.id}"
          click_link arrow
          visit current_path
          expect(element.text).to eq("2")
        end
      end
    end

    it 'should display table of solutions' do
      expect(page).to have_selector('.solutions-table')
    end

    context 'when there are no solutions' do
      let(:solution) { Solution.new }
      
      it 'should display proper text' do
        expect(page).to have_selector('#no-solutions')
      end
    end
  end

  describe 'creating a new solution', :js do
    before { create_logged_in_user }

    it "should allow you to create a new solution" do
      visit new_challenge_solution_path(challenge)
      fill_in "Title", with: "My Title"
      find('#editor textarea').set('My Code')
      click_button "Submit Solution"
      expect(current_path).to eq(challenge_path(challenge))
      expect(page).to have_content("My Title")
    end
  end

  describe 'solution show page' do
    before do
      challenge.solutions << solution
      visit_path_and_login_with(challenge_solution_path(challenge, solution), user)
    end

    it 'should contain soltion details' do
      expect(page).to have_content(solution.source)
    end

    describe "updating a solution" do
      let(:user) { User.make!(:admin) }
      before { click_link("Edit") }

      it 'shows the edit form' do
        expect(page).to have_content("Editing solution")
      end

      it 'correctly updates solution', :js do
        # there isn't a reliable way to predict what the code highlighter will
        # do to a string so I used a non-breaking string.
        find('#editor textarea').set('More_code_yay')
        click_button "Update Solution"
        visit challenge_solution_path(challenge, solution)
        expect(page).to have_content("More_code_yay")
      end
    end

    describe 'showing a solution' do
      it 'should have link back to challenge' do
        click_link("<< Back to #{challenge.title}")
        expect(current_path).to eq(challenge_path(challenge))
      end
    end

    describe "admin security" do
      it 'should not allow normal users to edit' do
        expect(page).to_not have_link("Edit")
      end

      context 'as an admin' do
        let(:user) { User.make!(:admin) }
        it 'should allow admin to edit' do
          click_link('Edit')
          expect(page).to have_content("Editing solution")
        end

        it 'should properly delete solution' do
          visit challenge_path(challenge)
          click_link('Destroy')
          visit challenge_path(challenge)
          expect(page).to have_selector('#no-solutions')
        end
      end
    end
  end
end
