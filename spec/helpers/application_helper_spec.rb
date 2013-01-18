require 'spec_helper'

describe ApplicationHelper do 

  class TestHelper
    include ApplicationHelper
    include ActionView::Helpers
  end

  subject { TestHelper.new }

  describe "#display_user" do 
    context "with no user" do 
      let(:user) { nil }

      it "returns Anonymous" do 
        subject.display_user(user).should == "anonymous"
      end
    end

    context "with a twitter user" do 
      let(:user) { User.make!(:twitter) }

      it "returns a linked up twitter name" do 
        subject.display_user(user).should == "<a href=\"http://www.twitter.com/twitter-dude\">@twitter-dude</a>"
      end
    end

    context "with a github user" do 
      let(:user) { User.make!(:github) }

      it "returns a linked up github name" do 
        subject.display_user(user).should == "<a href=\"http://www.github.com/github-chick\">github-chick</a>"
      end
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