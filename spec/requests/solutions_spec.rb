require 'spec_helper'

describe "Solutions" do
  let(:user) { User.make! }
  let(:challenge) { Challenge.make! }
  let(:solution) { Solution.make! }
  subject { page }
  
  before do
    challenge.solutions << solution
    visit_path_and_login_with(challenge_solution_path(challenge, solution), user)
  end

  it { should have_content(solution.notes) }

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
    end
  end

end
