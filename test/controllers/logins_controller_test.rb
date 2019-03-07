require 'test_helper'

class LoginsControllerTest < ActionDispatch::IntegrationTest
  test "should get [create,refresh,reconnect,destroy,show]" do
    get logins_[create, refresh, reconnect, destroy, showByLoginID]_url
    assert_response :success
  end

end
