require 'test_helper'

class CallBackControllerTest < ActionDispatch::IntegrationTest
  test "should get process" do
    get call_back_process_url
    assert_response :success
  end

end
