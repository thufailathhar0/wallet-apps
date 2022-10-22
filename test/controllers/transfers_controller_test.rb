require "test_helper"

class TransfersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @transfer = transactions(:two)
  end

  test "should get index" do
    get transfers_url
    assert_response :success
  end

  test "should get new" do
    get new_transfer_url
    assert_response :success
  end

  test "should create transfer" do
    assert_difference('Transaction.count') do
      post transfers_url, params: { transaction: { source_id: 2, target_id: 1, amount: 100 } }
    end

    assert_redirected_to transfer_url(Transaction.last)
  end

  test "should show transfer" do
    get transfer_url(@transfer)
    assert_response :success
  end
end
