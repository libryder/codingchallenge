require 'spec_helper'

describe ApplicationHelper do

  class TestHelper
    include ApplicationHelper
    include ActionView::Helpers
  end

  subject { TestHelper.new }

  describe "#display_user" do

    let(:challenge) { mock "Challenge" }

    context "with an old challenge" do
      let(:user) { User.make!(:twitter) }

      it "returns a linked up user name" do
        subject.should_receive(:user_path).with(user).and_return("/users/#{user.id}")
        challenge.should_receive(:expired?).and_return true
        expect(subject.display_user(user, challenge)).to eq("<a href=\"/users/#{user.id}\">#{user.username}</a>")
      end
    end

    context "with a current challenge" do
      let(:user) { User.make!(:twitter) }

      it "it just calls them a clever user" do
        challenge.should_receive(:expired?).and_return false
        expect(subject.display_user(user, challenge)).to eq("Clever User")
      end
    end

    context "with no challenge" do
      let(:user) { User.make!(:twitter) }

      it "returns a linked up user name" do
        subject.should_receive(:user_path).with(user).and_return("/users/#{user.id}")
        expect(subject.display_user(user)).to eq("<a href=\"/users/#{user.id}\">#{user.username}</a>")
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
  
    context "with html" do
      let(:solution) { Solution.make!(:html) }
      before { Solution.any_instance.stub(parse_source: solution.source )}


      it "it returns the ruby icon" do
        subject.should_not_receive(:image_tag)
        subject.display_language(solution).should eq "html"
      end
    end
  end
end