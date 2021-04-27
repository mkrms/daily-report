require 'test_helper'

class DailyReportsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get daily_reports_index_url
    assert_response :success
  end

  test "should get new" do
    get daily_reports_new_url
    assert_response :success
  end

  test "should get edit" do
    get daily_reports_edit_url
    assert_response :success
  end

  test "should get show" do
    get daily_reports_show_url
    assert_response :success
  end

end
