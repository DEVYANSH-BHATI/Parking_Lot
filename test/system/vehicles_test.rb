require "application_system_test_case"

class VehiclesTest < ApplicationSystemTestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "visiting the index" do
    visit vehicles_url
    assert_selector "h1", text: "Vehicles"
  end

  test "should create vehicle" do
    visit vehicles_url
    click_on "New vehicle"

    fill_in "Charge", with: @vehicle.charge_id
    fill_in "Charges", with: @vehicle.charges
    fill_in "In time", with: @vehicle.in_time
    fill_in "Number", with: @vehicle.number
    fill_in "Out time", with: @vehicle.out_time
    fill_in "Status", with: @vehicle.status
    fill_in "User", with: @vehicle.user_id
    click_on "Create Vehicle"

    assert_text "Vehicle was successfully created"
    click_on "Back"
  end

  test "should update Vehicle" do
    visit vehicle_url(@vehicle)
    click_on "Edit this vehicle", match: :first

    fill_in "Charge", with: @vehicle.charge_id
    fill_in "Charges", with: @vehicle.charges
    fill_in "In time", with: @vehicle.in_time
    fill_in "Number", with: @vehicle.number
    fill_in "Out time", with: @vehicle.out_time
    fill_in "Status", with: @vehicle.status
    fill_in "User", with: @vehicle.user_id
    click_on "Update Vehicle"

    assert_text "Vehicle was successfully updated"
    click_on "Back"
  end

  test "should destroy Vehicle" do
    visit vehicle_url(@vehicle)
    click_on "Destroy this vehicle", match: :first

    assert_text "Vehicle was successfully destroyed"
  end
end
