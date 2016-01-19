require 'test_helper'

class BidsControllerTest < ActionController::TestCase
  test "should get _new_bid" do
    get :_new_bid
    assert_response :success
  end

end
