require 'spec_helper'

describe Solution do
  let(:user) { User.make! }
  let(:challenge) { Challenge.make! }
  let!(:solution) { Solution.make!(challenge: challenge) }

  it { should belong_to(:challenge) }
  it { should validate_presence_of(:source) }
  it { should validate_presence_of(:title) }
  it { should belong_to(:user) }

  describe '#create' do
    it "should save the record" do
      expect(solution.errors).to be_blank
    end
  end

  describe '#by_popularity' do
    let!(:new_solution) { Solution.make!(challenge: challenge) }

    it 'should order by date' do
      expect(Solution.all.first).to eq(solution)
    end

    it 'should order by popularity' do
      user.cast_up_vote(new_solution)
      expect(challenge.solutions.by_popularity.first).to eq(new_solution)
    end
  end
end
