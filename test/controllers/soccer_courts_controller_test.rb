require 'test_helper'

class SoccerCourtsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @soccer_court = soccer_courts(:one)
  end

  test "should get index" do
    get soccer_courts_url
    assert_response :success
  end

  test "should get new" do
    get new_soccer_court_url
    assert_response :success
  end

  test "should create soccer_court" do
    assert_difference('SoccerCourt.count') do
      post soccer_courts_url, params: { soccer_court: { isActive: @soccer_court.isActive, location: @soccer_court.location, name: @soccer_court.name, price: @soccer_court.price } }
    end

    assert_redirected_to soccer_court_url(SoccerCourt.last)
  end

  test "should show soccer_court" do
    get soccer_court_url(@soccer_court)
    assert_response :success
  end

  test "should get edit" do
    get edit_soccer_court_url(@soccer_court)
    assert_response :success
  end

  test "should update soccer_court" do
    patch soccer_court_url(@soccer_court), params: { soccer_court: { isActive: @soccer_court.isActive, location: @soccer_court.location, name: @soccer_court.name, price: @soccer_court.price } }
    assert_redirected_to soccer_court_url(@soccer_court)
  end

  test "should destroy soccer_court" do
    assert_difference('SoccerCourt.count', -1) do
      delete soccer_court_url(@soccer_court)
    end

    assert_redirected_to soccer_courts_url
  end
end
