require "test_helper"

class MobSpawnPointsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @mob_spawn_point = mob_spawn_points(:one)
  end

  test "should get index" do
    get mob_spawn_points_url
    assert_response :success
  end

  test "should get new" do
    get new_mob_spawn_point_url
    assert_response :success
  end

  test "should create mob_spawn_point" do
    assert_difference('MobSpawnPoint.count') do
      post mob_spawn_points_url, params: { mob_spawn_point: { mobid: @mob_spawn_point.mobid, mobname: @mob_spawn_point.mobname, polutils_name: @mob_spawn_point.polutils_name } }
    end

    assert_redirected_to mob_spawn_point_url(MobSpawnPoint.last)
  end

  test "should show mob_spawn_point" do
    get mob_spawn_point_url(@mob_spawn_point)
    assert_response :success
  end

  test "should get edit" do
    get edit_mob_spawn_point_url(@mob_spawn_point)
    assert_response :success
  end

  test "should update mob_spawn_point" do
    patch mob_spawn_point_url(@mob_spawn_point), params: { mob_spawn_point: { mobid: @mob_spawn_point.mobid, mobname: @mob_spawn_point.mobname, polutils_name: @mob_spawn_point.polutils_name } }
    assert_redirected_to mob_spawn_point_url(@mob_spawn_point)
  end

  test "should destroy mob_spawn_point" do
    assert_difference('MobSpawnPoint.count', -1) do
      delete mob_spawn_point_url(@mob_spawn_point)
    end

    assert_redirected_to mob_spawn_points_url
  end
end
