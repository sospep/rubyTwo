require 'test_helper'

class BalloonsControllerTest < ActionDispatch::IntegrationTest
  # TEST - 
  test "should get page home" do
    get home_url
    assert_response :success
  end

  # TEST - 
  test "should get page show balloon" do
    # this test errors, although it correctly passes id = 6 and there is currently a balloon with id of 6 in db
    # @balloon = Balloon.find(params[:id])
    paramsPass = { id: '4' }
    # params = { id: '/6' }
    # params = {'6' }
    # params = '/6' 
    # note format used, from rSpec cheat sheet
    get show_url, params: paramsPass
    # get show_url, params: balloon_id "4"
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
    paramsPass = { username:'don', password:'don'}
    
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
