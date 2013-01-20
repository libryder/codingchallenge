require 'spec_helper'

describe ApplicationHelper do 

  class TestHelper
    include ApplicationHelper
    include ActionView::Helpers
  end

  subject { TestHelper.new }

  describe "#display_user" do 
    let(:user) { User.make!(:twitter) }

    it "returns a linked up user name" do
      subject.should_receive(:user_path).with(user).and_return("/users/#{user.id}")
      expect(subject.display_user(user)).to eq("<a href=\"/users/#{user.id}\">#{user.username}</a>")
    end
  end

  describe "#display_language" do 
    context "with ruby" do 
      let(:solution) { Solution.make!(:ruby) }

      it "it returns the ruby icon" do 
        subject.should_receive(:image_tag).with("ruby_logo.png", {:class=>"header-logo", :title=>"ruby"})
        subject.display_language(solution)
      end
    end
  
    context "with other" do 
      let(:solution) { Solution.make!(:other) }

      it "it returns the ruby icon" do 
        subject.should_not_receive(:image_tag)
        subject.display_language(solution).should eq "other"
      end
    end
  end
end