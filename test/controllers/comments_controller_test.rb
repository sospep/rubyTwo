require 'test_helper'

class CommentsControllerTest < ActionDispatch::IntegrationTest
  
  # TEST api endpoint - comments all
  test "should get API commments json" do
    get api_v1_comments_url
    assert_response :success
  end

end
