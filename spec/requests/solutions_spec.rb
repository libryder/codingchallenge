require 'spec_helper'

describe "Solutions" do
  let(:user) { User.make! }
  let(:challenge) { Challenge.make! }
  let(:solution) { Solution.make! }
  after { DatabaseCleaner.clean }
  
  describe 'solutions list page' do
    before do
      challenge.solutions << solution
      visit challenge_solutions_path(challenge)
    end
    
    describe 'voting mechanism', :js, :vcr do
      it 'should not allow you to when not logged in' do
        expect(page).to_not have_css('.icon-circle-arrow-up')
      end

      context 'when logged in' do
        before { visit_path_and_login_with(challenge_path(challenge), user) }

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
          element = page.find('.vote-cell div')
          expect(element.text).to eq("0")
        end

        it 'should increment the count' do
          element = page.find('.vote-cell div')
          arrow = "up_vote_#{solution.id}"
          click_link arrow
          visit current_path
          expect(element.text).to eq("1")
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

  describe 'solution show page' do
    before do
      challenge.solutions << solution
      visit_path_and_login_with(challenge_solution_path(challenge, solution), user)
    end

    it 'should contain soltion details' do
      expect(page).to have_content(solution.notes)
    end

    describe "updating a solution" do
      let(:user) { User.make!(:admin) }
      before { click_link("Edit") }

      it 'shows the edit form' do
        expect(page).to have_content("Editing solution")
      end

      it 'correctly updates solution' do
        fill_in("Notes", with: "new notes")
        click_button('Update Solution')
        expect(page).to have_content("new notes")
        expect(current_path).to eq(challenge_solution_path(challenge, solution))
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
