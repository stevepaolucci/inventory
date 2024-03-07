require "application_system_test_case"

class ItAssetsTest < ApplicationSystemTestCase
  setup do
    @it_asset = it_assets(:one)
  end

  test "visiting the index" do
    visit it_assets_url
    assert_selector "h1", text: "It assets"
  end

  test "should create it asset" do
    visit it_assets_url
    click_on "New it asset"

    fill_in "Asset name", with: @it_asset.asset_name
    fill_in "Asset type", with: @it_asset.asset_type
    fill_in "Barcode", with: @it_asset.barcode
    fill_in "Distributed at", with: @it_asset.distributed_at
    fill_in "Location", with: @it_asset.location
    fill_in "Notes", with: @it_asset.notes
    fill_in "Password", with: @it_asset.password
    fill_in "Returned at", with: @it_asset.returned_at
    fill_in "Username", with: @it_asset.username
    click_on "Create It asset"

    assert_text "It asset was successfully created"
    click_on "Back"
  end

  test "should update It asset" do
    visit it_asset_url(@it_asset)
    click_on "Edit this it asset", match: :first

    fill_in "Asset name", with: @it_asset.asset_name
    fill_in "Asset type", with: @it_asset.asset_type
    fill_in "Barcode", with: @it_asset.barcode
    fill_in "Distributed at", with: @it_asset.distributed_at
    fill_in "Location", with: @it_asset.location
    fill_in "Notes", with: @it_asset.notes
    fill_in "Password", with: @it_asset.password
    fill_in "Returned at", with: @it_asset.returned_at
    fill_in "Username", with: @it_asset.username
    click_on "Update It asset"

    assert_text "It asset was successfully updated"
    click_on "Back"
  end

  test "should destroy It asset" do
    visit it_asset_url(@it_asset)
    click_on "Destroy this it asset", match: :first

    assert_text "It asset was successfully destroyed"
  end
end
