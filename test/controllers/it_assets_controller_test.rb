require "test_helper"

class ItAssetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @it_asset = it_assets(:one)
  end

  test "should get index" do
    get it_assets_url
    assert_response :success
  end

  test "should get new" do
    get new_it_asset_url
    assert_response :success
  end

  test "should create it_asset" do
    assert_difference("ItAsset.count") do
      post it_assets_url, params: { it_asset: { asset_name: @it_asset.asset_name, asset_type: @it_asset.asset_type, barcode: @it_asset.barcode, distributed_at: @it_asset.distributed_at, location: @it_asset.location, notes: @it_asset.notes, password: @it_asset.password, returned_at: @it_asset.returned_at, username: @it_asset.username } }
    end

    assert_redirected_to it_asset_url(ItAsset.last)
  end

  test "should show it_asset" do
    get it_asset_url(@it_asset)
    assert_response :success
  end

  test "should get edit" do
    get edit_it_asset_url(@it_asset)
    assert_response :success
  end

  test "should update it_asset" do
    patch it_asset_url(@it_asset), params: { it_asset: { asset_name: @it_asset.asset_name, asset_type: @it_asset.asset_type, barcode: @it_asset.barcode, distributed_at: @it_asset.distributed_at, location: @it_asset.location, notes: @it_asset.notes, password: @it_asset.password, returned_at: @it_asset.returned_at, username: @it_asset.username } }
    assert_redirected_to it_asset_url(@it_asset)
  end

  test "should destroy it_asset" do
    assert_difference("ItAsset.count", -1) do
      delete it_asset_url(@it_asset)
    end

    assert_redirected_to it_assets_url
  end
end
