require 'spec_helper'

describe "Challenges" do
  
  describe "GET /challenges" do
    
    context 'as an admin' do
      it "returns status 200" do
        get challenges_path
        response.status.should be(200)
      end
    end

    context 'as a normal user' do

    end
  end
end
