require 'test_helper'

class CalificaControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get califica_new_url
    assert_response :success
  end

end
