require 'spec_helper'

describe User do
  let(:user) { User.make! }
  let(:voter) { User.make! }
  let(:solution) { Solution.make!(user: user) }

  describe '#cast_up_vote' do
    it 'should change solution up votes' do
      expect{ voter.cast_up_vote(solution) }.to change{ solution.up_votes.count }.from(0).to(1)
    end
  end

  describe '#cast_down_vote' do
    it 'should change solution down votes' do
      expect{ voter.cast_down_vote(solution) }.to change{ solution.down_votes.count }.from(0).to(1)
    end
  end

  describe '#up_vote_count' do
    it 'should return the proper number of upvotes' do
      voter.cast_up_vote(solution)
      expect(user.up_vote_count).to eq(1)
    end
  end
end
