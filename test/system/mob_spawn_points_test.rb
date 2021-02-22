require "application_system_test_case"

class MobSpawnPointsTest < ApplicationSystemTestCase
  setup do
    @mob_spawn_point = mob_spawn_points(:one)
  end

  test "visiting the index" do
    visit mob_spawn_points_url
    assert_selector "h1", text: "Mob Spawn Points"
  end

  test "creating a Mob spawn point" do
    visit mob_spawn_points_url
    click_on "New Mob Spawn Point"

    fill_in "Mobid", with: @mob_spawn_point.mobid
    fill_in "Mobname", with: @mob_spawn_point.mobname
    fill_in "Polutils name", with: @mob_spawn_point.polutils_name
    click_on "Create Mob spawn point"

    assert_text "Mob spawn point was successfully created"
    click_on "Back"
  end

  test "updating a Mob spawn point" do
    visit mob_spawn_points_url
    click_on "Edit", match: :first

    fill_in "Mobid", with: @mob_spawn_point.mobid
    fill_in "Mobname", with: @mob_spawn_point.mobname
    fill_in "Polutils name", with: @mob_spawn_point.polutils_name
    click_on "Update Mob spawn point"

    assert_text "Mob spawn point was successfully updated"
    click_on "Back"
  end

  test "destroying a Mob spawn point" do
    visit mob_spawn_points_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mob spawn point was successfully destroyed"
  end
end
