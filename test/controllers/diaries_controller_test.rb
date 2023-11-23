require "test_helper"

class DiariesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get diaries_new_url
    assert_response :success
  end
end
