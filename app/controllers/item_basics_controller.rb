class ItemBasicsController < ApplicationController
  before_action :set_item_basic, only: %i[ show edit update destroy ]

  # GET /item_basics or /item_basics.json
  def index
    @q = ItemBasic.ransack(params[:q])
    @item_basics = @q.result.paginate(:page => params[:page]).order('itemid ASC')
  end

  # GET /item_basics/1 or /item_basics/1.json
  def show
  end

  # GET /item_basics/new
  def new
    @item_basic = ItemBasic.new
  end

  # GET /item_basics/1/edit
  def edit
  end

  # POST /item_basics or /item_basics.json
  def create
    @item_basic = ItemBasic.new(item_basic_params)

    respond_to do |format|
      if @item_basic.save
        format.html { redirect_to @item_basic, notice: "Item basic was successfully created." }
        format.json { render :show, status: :created, location: @item_basic }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @item_basic.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /item_basics/1 or /item_basics/1.json
  def update
    respond_to do |format|
      if @item_basic.update(item_basic_params)
        format.html { redirect_to @item_basic, notice: "Item basic was successfully updated." }
        format.json { render :show, status: :ok, location: @item_basic }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @item_basic.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /item_basics/1 or /item_basics/1.json
  def destroy
    @item_basic.destroy
    respond_to do |format|
      format.html { redirect_to item_basics_url, notice: "Item basic was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_item_basic
      @item_basic = ItemBasic.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def item_basic_params
      params.require(:item_basic).permit(:itemid, :subid, :name, :sortname, :stackSize, :flags, :aH, :NoSale, :BaseSell)
    end
end
