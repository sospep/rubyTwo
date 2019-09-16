require 'test_helper'

class CountsControllerTest < ActionDispatch::IntegrationTest
  # TEST - counts xml page
  test "should get page counts" do
    get counts_url
    assert_response :success
  end
end
