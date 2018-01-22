require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include FactoryBot::Syntax::Methods

  def signin user
    post user_session_path user: { email: user.email, password: 'password' }
  end
  # Add more helper methods to be used by all tests here...
end
