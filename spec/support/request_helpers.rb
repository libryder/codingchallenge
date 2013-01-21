include Warden::Test::Helpers
 
module RequestHelpers
  def create_logged_in_user
    user = User.make!
    login(user)
    user
  end

  def create_logged_in_admin
    user = User.make!(:admin)
    login(user)
    user
  end
 
  def login(user)    
    login_as user, scope: :user
  end
end

RSpec.configure do |config|
  config.include RequestHelpers, :type => :request
end