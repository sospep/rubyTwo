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
    # call the login process defined in test_helper.rb
    # http_login
    # sign_in_as(:username'don', :password'don')
    # @userDon = User.new('don','don')
    
    # sign_in_as(@userDon)
    # because new requires basic auth and we have provided none
    # TRY= 
    # paramsPass = { username:'don', password:'don'}
    paramsPass = { name:'don', password:'don'}
    
    # TRY=
    # get new_url, params: paramsPass
    # FAILURE= access denied
    
    # TRY=
    # post new_url, params: paramsPass
    # ERROR - no POST new_url 
    # post '/new', params: paramsPass 
    # ERROR = no route matches
    # post '/balloons#new', params: paramsPass
    # FAILURE= access denied
    
    # TRY=  defined route for post request in routes
    post balloon_new_url, params: paramsPass
    # FAILURE= access denied 

    # assert_response :missing
    assert_response :success
  end

  # TEST - access edit page without authorization
  test "should not get page edit balloons" do
    get edit_url
    assert_response(401)
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
