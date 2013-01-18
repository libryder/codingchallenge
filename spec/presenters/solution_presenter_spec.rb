require 'spec_helper'

describe SolutionPresenter do
  let(:solution) { Solution.make }
  let(:presenter) { SolutionPresenter.new(solution, view) }
  let(:user) { User.make! }
  
  before do 
    presenter.stub(
      link_to: '', 
      solution_up_vote_path: nil,
      solution_down_vote_path: nil,
      current_user: user
    )
  end
  
  subject { presenter }

  describe '#up_vote_arrow' do
    it 'should return a link with the right class' do
      expect(subject.up_vote_arrow).to eq('')
    end
  end

  describe '#down_vote_arrow' do
    it 'should return a link with the right class' do
      expect(subject.down_vote_arrow).to eq('')
    end
  end
end