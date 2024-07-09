require "test_helper"

class PowerbanksControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get powerbanks_index_url
    assert_response :success
  end

  test "should get show" do
    get powerbanks_show_url
    assert_response :success
  end

  test "should get new" do
    get powerbanks_new_url
    assert_response :success
  end

  test "should get edit" do
    get powerbanks_edit_url
    assert_response :success
  end
end
