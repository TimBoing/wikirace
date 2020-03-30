require 'test_helper'

class CreatorControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get creator_show_url
    assert_response :success
  end

end
