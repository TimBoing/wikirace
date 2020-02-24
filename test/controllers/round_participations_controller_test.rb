require 'test_helper'

class RoundParticipationsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get round_participations_create_url
    assert_response :success
  end

  test "should get new" do
    get round_participations_new_url
    assert_response :success
  end

  test "should get edit" do
    get round_participations_edit_url
    assert_response :success
  end

  test "should get update" do
    get round_participations_update_url
    assert_response :success
  end

end
