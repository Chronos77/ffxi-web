require "application_system_test_case"

class ItemBasicsTest < ApplicationSystemTestCase
  setup do
    @item_basic = item_basics(:one)
  end

  test "visiting the index" do
    visit item_basics_url
    assert_selector "h1", text: "Item Basics"
  end

  test "creating a Item basic" do
    visit item_basics_url
    click_on "New Item Basic"

    fill_in "Basesel", with: @item_basic.BaseSel
    fill_in "Nosale", with: @item_basic.NoSale
    fill_in "Ah", with: @item_basic.aH
    fill_in "Flags", with: @item_basic.flags
    fill_in "Itemid", with: @item_basic.itemid
    fill_in "Name", with: @item_basic.name
    fill_in "Sortname", with: @item_basic.sortname
    fill_in "Stacksize", with: @item_basic.stackSize
    fill_in "Subid", with: @item_basic.subid
    click_on "Create Item basic"

    assert_text "Item basic was successfully created"
    click_on "Back"
  end

  test "updating a Item basic" do
    visit item_basics_url
    click_on "Edit", match: :first

    fill_in "Basesel", with: @item_basic.BaseSel
    fill_in "Nosale", with: @item_basic.NoSale
    fill_in "Ah", with: @item_basic.aH
    fill_in "Flags", with: @item_basic.flags
    fill_in "Itemid", with: @item_basic.itemid
    fill_in "Name", with: @item_basic.name
    fill_in "Sortname", with: @item_basic.sortname
    fill_in "Stacksize", with: @item_basic.stackSize
    fill_in "Subid", with: @item_basic.subid
    click_on "Update Item basic"

    assert_text "Item basic was successfully updated"
    click_on "Back"
  end

  test "destroying a Item basic" do
    visit item_basics_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Item basic was successfully destroyed"
  end
end
