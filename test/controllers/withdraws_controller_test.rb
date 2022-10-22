require "test_helper"

class WithdrawsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @withdraw = transactions(:three)
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
    assert_difference('Transaction.count') do
      post withdraws_url, params: { transaction: { source_id: 2, target_id: 1, amount: 100 } }
    end

    assert_redirected_to withdraw_url(Transaction.last)
  end

  test "should show withdraw" do
    get withdraw_url(@withdraw)
    assert_response :success
  end
end
