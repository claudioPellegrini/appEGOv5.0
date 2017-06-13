require 'test_helper'

class FranjasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @franja = franjas(:one)
  end

  test "should get index" do
    get franjas_url
    assert_response :success
  end

  test "should get new" do
    get new_franja_url
    assert_response :success
  end

  test "should create franja" do
    assert_difference('Franja.count') do
      post franjas_url, params: { franja: { fecha: @franja.fecha, primera_hasta: @franja.primera_hasta, primera_precio: @franja.primera_precio, segunda_hasta: @franja.segunda_hasta, segunda_precio: @franja.segunda_precio, tercera_precio: @franja.tercera_precio } }
    end

    assert_redirected_to franja_url(Franja.last)
  end

  test "should show franja" do
    get franja_url(@franja)
    assert_response :success
  end

  test "should get edit" do
    get edit_franja_url(@franja)
    assert_response :success
  end

  test "should update franja" do
    patch franja_url(@franja), params: { franja: { fecha: @franja.fecha, primera_hasta: @franja.primera_hasta, primera_precio: @franja.primera_precio, segunda_hasta: @franja.segunda_hasta, segunda_precio: @franja.segunda_precio, tercera_precio: @franja.tercera_precio } }
    assert_redirected_to franja_url(@franja)
  end

  test "should destroy franja" do
    assert_difference('Franja.count', -1) do
      delete franja_url(@franja)
    end

    assert_redirected_to franjas_url
  end
end
