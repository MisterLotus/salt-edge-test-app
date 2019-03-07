require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get new,showAll" do
    get users_new, showAll_url
    assert_response :success
  end

end
