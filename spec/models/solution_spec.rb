require 'spec_helper'

describe Solution do
  it { should belong_to(:challenge) }
  it { should validate_presence_of(:solution_url) }
  it { should validate_presence_of(:notes) }
  it { should belong_to(:user) }
  
  describe '#create' do
    it "should save the record" do
      expect(Solution.make!.errors).to be_blank
    end
  end
end
