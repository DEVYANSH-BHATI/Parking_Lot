require "application_system_test_case"

class ChargesTest < ApplicationSystemTestCase
  setup do
    @charge = charges(:one)
  end

  test "visiting the index" do
    visit charges_url
    assert_selector "h1", text: "Charges"
  end

  test "should create charge" do
    visit charges_url
    click_on "New charge"

    fill_in "Extra hour charges", with: @charge.extra_hour_charges
    fill_in "Min charge", with: @charge.min_charge
    fill_in "Min hours", with: @charge.min_hours
    fill_in "Vehicle type", with: @charge.vehicle_type
    click_on "Create Charge"

    assert_text "Charge was successfully created"
    click_on "Back"
  end

  test "should update Charge" do
    visit charge_url(@charge)
    click_on "Edit this charge", match: :first

    fill_in "Extra hour charges", with: @charge.extra_hour_charges
    fill_in "Min charge", with: @charge.min_charge
    fill_in "Min hours", with: @charge.min_hours
    fill_in "Vehicle type", with: @charge.vehicle_type
    click_on "Update Charge"

    assert_text "Charge was successfully updated"
    click_on "Back"
  end

  test "should destroy Charge" do
    visit charge_url(@charge)
    click_on "Destroy this charge", match: :first

    assert_text "Charge was successfully destroyed"
  end
end
