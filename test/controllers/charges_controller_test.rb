require "test_helper"

class ChargesControllerTest < ActionDispatch::IntegrationTest
  test "should get charges" do
    get charges_charges_url
    assert_response :success
  end
end
