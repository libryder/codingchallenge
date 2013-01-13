require 'spec_helper'

describe Challenge do

  it { should have_many(:solutions) }
  it { should validate_presence_of(:description) }

  describe '#create' do
    it "should save the record" do
      expect(Challenge.make!.errors).to be_blank
    end
  end

end