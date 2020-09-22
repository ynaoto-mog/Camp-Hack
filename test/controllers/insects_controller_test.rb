require 'test_helper'

class InsectsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @insect = insects(:one)
  end

  test "should get index" do
    get insects_url, as: :json
    assert_response :success
  end

  test "should create insect" do
    assert_difference('Insect.count') do
      post insects_url, params: { insect: { category_id: @insect.category_id, date: @insect.date, desription: @insect.desription, hour: @insect.hour, image: @insect.image, latitude: @insect.latitude, longitude: @insect.longitude, name: @insect.name, prfc: @insect.prfc } }, as: :json
    end

    assert_response 201
  end

  test "should show insect" do
    get insect_url(@insect), as: :json
    assert_response :success
  end

  test "should update insect" do
    patch insect_url(@insect), params: { insect: { category_id: @insect.category_id, date: @insect.date, desription: @insect.desription, hour: @insect.hour, image: @insect.image, latitude: @insect.latitude, longitude: @insect.longitude, name: @insect.name, prfc: @insect.prfc } }, as: :json
    assert_response 200
  end

  test "should destroy insect" do
    assert_difference('Insect.count', -1) do
      delete insect_url(@insect), as: :json
    end

    assert_response 204
  end
end
