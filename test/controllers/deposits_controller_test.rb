require "test_helper"

class DepositsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposit = deposits(:one)
  end

  test "should get index" do
    get deposits_url
    assert_response :success
  end

  test "should get new" do
    get new_deposit_url
    assert_response :success
  end

  test "should create deposit" do
    assert_difference('Deposit.count') do
      post deposits_url, params: { deposit: { sender_id: 1, receiver_id: 1, amount: 1000 } }
    end

    assert_redirected_to deposit_url(Deposit.last)
  end

  test "should show deposit" do
    get deposit_url(@deposit)
    assert_response :success
  end
end
