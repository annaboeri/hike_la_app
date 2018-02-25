require 'test_helper'

class SessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get sessions_new_url
    assert_response :success
  end

  test "should get create" do
    get sessions_create_url
    assert_response :success
  end

  test "should get destrory" do
    get sessions_destrory_url
    assert_response :success
  end

end
