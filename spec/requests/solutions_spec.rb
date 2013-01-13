require 'spec_helper'

describe "Solutions" do
  describe "GET /solutions" do
    it "accessing resource should be successful" do
      get solutions_path
      response.status.should be(200)
    end
  end
end
