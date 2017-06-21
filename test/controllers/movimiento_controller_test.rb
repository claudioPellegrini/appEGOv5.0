require 'test_helper'

class MovimientoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get movimiento_index_url
    assert_response :success
  end

end
