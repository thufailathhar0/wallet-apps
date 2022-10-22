require "test_helper"

class DepositsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deposit = transactions(:one)
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
    assert_difference('Transaction.count') do
      post deposits_url, params: { transaction: { source_id: 1, target_id: 1, amount: 1000 } }
    end

    assert_redirected_to deposit_url(Transaction.last)
  end

  test "should show deposit" do
    get deposit_url(@deposit)
    assert_response :success
  end
end
