require 'test_helper'

class PagesControllerTest < ActionDispatch::IntegrationTest
  test "should get page about" do
    get about_url #// wrong # 
    assert_response :success
  end
end
