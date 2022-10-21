require "test_helper"

class WithdrawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @withdraw = withdraws(:one)
  end

  test "should get index" do
    get withdraws_url
    assert_response :success
  end

  test "should get new" do
    get new_withdraw_url
    assert_response :success
  end

  test "should create withdraw" do
    assert_difference('Withdraw.count') do
      post withdraws_url, params: { withdraw: { sender_id: 2, receiver_id: 2, amount: 1000, receiver_number: "123123123" } }
    end

    assert_redirected_to withdraw_url(Withdraw.last)
  end

  test "should show withdraw" do
    get withdraw_url(@withdraw)
    assert_response :success
  end
end
