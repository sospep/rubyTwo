require 'test_helper'

class BalloonsControllerTest < ActionDispatch::IntegrationTest

  setup do
    # @list = lists(:one)
    @balloon = balloons(:one)
  end

  # TEST - 
  test "should get page home" do
    get home_url
    assert_response :success
  end

  # TEST - show balloon - balloon/1
  test "should get page show balloon" do
    # using fixtures (balloons.yml) 
    # get show_url, params: @balloon.id
    # PASS BUT 
    # get '/balloons#show/1' 

    # PASS
    @paramsPass = { id:1}
    get show_url, params: @paramsPass
    assert_response :success
  end

  # TEST 
  test "should not get page new balloon" do
    # because new requires basic auth and we have provided none
    get new_url
    # assert_response :missing
    assert_response(401)
  end

  # TEST 
  test "should get page new balloon" do
    post balloon_new_url, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('don', 'don') }
    assert_response :success
  end

  # TEST - access edit page without authorization
  test "should not get page edit balloons" do
    get edit_url
    assert_response(401)
  end

  # TEST - access edit page with authorization
  test "should get page edit balloons" do
    post edit_balloon_url, headers: { Authorization: ActionController::HttpAuthentication::Basic.encode_credentials('don', 'don') }
    assert_response :success
  end

  # TEST api endpoint balloons all
  test "should get API balloons json" do
    # not sure of route name, try explicity call by path seems to work
    # test should actually be in different controller 
    # BUT there is /test/controllers/api/v1/balloons .... 
    # get '/api/v1/balloons#index'
    get api_v1_balloons_url
    assert_response :success
  end

end
