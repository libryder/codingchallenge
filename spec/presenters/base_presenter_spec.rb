require 'spec_helper'

describe BasePresenter do
  subject { BasePresenter.new(object, view) }

  let(:object) { stub }

  it "should create a class method to name the object" do
    subject.class.presents :sample_object
    expect(subject.sample_object).to eq(object)
  end

  it "should delegate missing methods to the view" do
    view.should_receive(:link_to)
    subject.link_to
  end
end
