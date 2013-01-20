require 'spec_helper'

describe UserLevel do

  let(:user) { User.make! }
  let(:solution) { Solution.make!(user: user) }
  let(:voter) { User.make! }

  subject(:user_level) { UserLevel.new(user) }

  context 'with no points' do
    its(:level) { should == 1 }
    its(:progress) { should == 0 }
  end

  context 'with one solution' do
    before { solution }

    its(:level) { should == 2 }
    its(:progress) { should == 23 }
  end

  context 'with one solution and 10 upvotes' do
    before do
      (1..10).each do
        u = User.make!
        u.cast_up_vote(solution)
      end
    end

    its(:level) { should == 4 }
    its(:progress) { should == 35 }

    context 'with several valid solutions' do
      before do
        (1..10).each do
          Solution.make!(valid_solution: true, user: user)
        end
      end

      its(:level) { should == 5 }
      its(:progress) { should == 67 }
    end
  end
end