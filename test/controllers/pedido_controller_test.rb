require 'test_helper'

class PedidoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get pedido_index_url
    assert_response :success
  end

end
