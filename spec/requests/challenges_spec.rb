require 'spec_helper'

describe "Challenges" do
  let(:user) { User(:admin).make! }

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

  describe 'create new challenge' do
    #visit_path_and_login_with(new_challenge_path, user)
  end
end
