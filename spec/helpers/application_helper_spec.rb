require 'spec_helper'

describe ApplicationHelper do 
  describe "#display_user" do 

    class TestHelper
      include ApplicationHelper
      include ActionView::Helpers::UrlHelper
    end

    subject { TestHelper.new }

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
        subject.display_user(user).should == "<a href=\"http://www.twitter.com/github-chick\">@github-chick</a>"
      end
    end
  end
end