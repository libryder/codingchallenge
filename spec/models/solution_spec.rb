require 'spec_helper'

describe Solution do
  it { should belong_to(:challenge) }
  it { should validate_presence_of(:source) }
  it { should belong_to(:user) }
  
  describe '#create' do
    it "should save the record" do
      expect(Solution.make!.errors).to be_blank
    end
  end
end
