require "test_helper"

class ItemBasicsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @item_basic = item_basics(:one)
  end

  test "should get index" do
    get item_basics_url
    assert_response :success
  end

  test "should get new" do
    get new_item_basic_url
    assert_response :success
  end

  test "should create item_basic" do
    assert_difference('ItemBasic.count') do
      post item_basics_url, params: { item_basic: { BaseSel: @item_basic.BaseSel, NoSale: @item_basic.NoSale, aH: @item_basic.aH, flags: @item_basic.flags, itemid: @item_basic.itemid, name: @item_basic.name, sortname: @item_basic.sortname, stackSize: @item_basic.stackSize, subid: @item_basic.subid } }
    end

    assert_redirected_to item_basic_url(ItemBasic.last)
  end

  test "should show item_basic" do
    get item_basic_url(@item_basic)
    assert_response :success
  end

  test "should get edit" do
    get edit_item_basic_url(@item_basic)
    assert_response :success
  end

  test "should update item_basic" do
    patch item_basic_url(@item_basic), params: { item_basic: { BaseSel: @item_basic.BaseSel, NoSale: @item_basic.NoSale, aH: @item_basic.aH, flags: @item_basic.flags, itemid: @item_basic.itemid, name: @item_basic.name, sortname: @item_basic.sortname, stackSize: @item_basic.stackSize, subid: @item_basic.subid } }
    assert_redirected_to item_basic_url(@item_basic)
  end

  test "should destroy item_basic" do
    assert_difference('ItemBasic.count', -1) do
      delete item_basic_url(@item_basic)
    end

    assert_redirected_to item_basics_url
  end
end
