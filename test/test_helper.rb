ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  
  # Add more helper methods to be used by all tests here...
  
  # include modules that define 2 auth methods, ] controllers, ] requests
  # config.include AuthRequestHelper, :type => :request
  # config.include AuthHelper, :type => :controller
 
  module SignInHelper
    def sign_in_as(user)
      post sign_in_url(username: user.username, password: user.password )
      # post new_url (username user.username password= user.password )
    end
  end
    
  class ActionDispatch::IntegrationTest
    include SignInHelper
  end

end
