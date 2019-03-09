require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get show_main" do
    get main_showMain_url
    assert_response :success
  end

end
