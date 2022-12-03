class MobSpawnPointsController < ApplicationController
  before_action :set_mob_spawn_point, only: %i[ show edit update destroy ]

  # GET /mob_spawn_points or /mob_spawn_points.json
  def index
    @q = MobSpawnPoint.ransack(params[:q])
    @mob_spawn_points = @q.result.paginate(:page => params[:page]).order('mobid ASC')
  end

  # GET /mob_spawn_points/1 or /mob_spawn_points/1.json
  def show
    @mob_group = MobGroup.find_by({ groupid: @mob_spawn_point.groupid, name: @mob_spawn_point.mobname })
    if @mob_group 
      @mob_pools = MobPool.where({ poolid: @mob_group.poolid })
      if @mob_pools.length > 0
        @mob_pool = @mob_pools.first
        @mob_spell_list = MobSpellList.where({ spell_list_id: @mob_pool.spellList })
        @mob_skill_list = MobSkillList.where({ skill_list_id: @mob_pool.skill_list_id })
      end
    end
  end

  # GET /mob_spawn_points/new
  def new
    @mob_spawn_point = MobSpawnPoint.new
  end

  # GET /mob_spawn_points/1/edit
  def edit
  end

  # POST /mob_spawn_points or /mob_spawn_points.json
  def create
    @mob_spawn_point = MobSpawnPoint.new(mob_spawn_point_params)

    respond_to do |format|
      if @mob_spawn_point.save
        format.html { redirect_to @mob_spawn_point, notice: "Mob spawn point was successfully created." }
        format.json { render :show, status: :created, location: @mob_spawn_point }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @mob_spawn_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /mob_spawn_points/1 or /mob_spawn_points/1.json
  def update
    respond_to do |format|
      if @mob_spawn_point.update(mob_spawn_point_params)
        format.html { redirect_to @mob_spawn_point, notice: "Mob spawn point was successfully updated." }
        format.json { render :show, status: :ok, location: @mob_spawn_point }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @mob_spawn_point.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /mob_spawn_points/1 or /mob_spawn_points/1.json
  def destroy
    @mob_spawn_point.destroy
    respond_to do |format|
      format.html { redirect_to mob_spawn_points_url, notice: "Mob spawn point was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_mob_spawn_point
      @mob_spawn_point = MobSpawnPoint.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def mob_spawn_point_params
      params.require(:mob_spawn_point).permit(:mobid, :mobname, :polutils_name)
    end
end
