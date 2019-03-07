require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get showMain" do
    get main_showMain_url
    assert_response :success
  end

end
