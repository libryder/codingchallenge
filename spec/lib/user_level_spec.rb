require 'spec_helper'

describe UserLevel do

  let(:user) { User.make! }
  let(:solution) { Solution.make!(user: user) }
  let(:voter) { User.make! }

  subject(:user_level) { UserLevel.new(user).level }

  context 'with no points' do
    it { should == 1 }
  end

  context 'with one solution' do
    before { solution }
    it { should == 2 }
  end

  context 'with one solution and 10 upvotes' do
    before do
      (1..10).each do
        u = User.make!
        u.cast_up_vote(solution)
      end
    end

    it { should == 4 }

    context 'with several valid solutions' do
      before do
        (1..10).each do
          Solution.make!(valid_solution: true, user: user)
        end
      end

      it { should == 5 }
    end
  end
end