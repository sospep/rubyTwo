require 'test_helper'

class BalloonsControllerTest < ActionDispatch::IntegrationTest
  test "should get page home" do
    get home_url
    assert_response :success
   end
end
