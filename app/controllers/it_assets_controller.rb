class ItAssetsController < ApplicationController
  before_action :set_it_asset, only: %i[ show edit update destroy ]

  # GET /it_assets or /it_assets.json
  def index
    @it_assets = ItAsset.all #.order(:barcode)
    if params['code'].present?
      @it_assets = @it_assets.where(barcode: params['code'])
      Scan.create(barcode: params['code'], scanned_at: Time.zone.now)
    end
    @it_assets = @it_assets.order(:asset_subtype) if params['order'].present?
    # redirect_to new_it_asset_path if @it_assets.count == 0
    redirect_to "/it_assets/new?barcode=#{params['code']}" if @it_assets.count == 0
  end

  # GET /it_assets/1 or /it_assets/1.json
  def show
  end

  # GET /it_assets/new
  def new
    @it_asset = ItAsset.new
  end

  # GET /it_assets/1/edit
  def edit
  end

  # POST /it_assets or /it_assets.json
  def create
    @it_asset = ItAsset.new(it_asset_params)

    respond_to do |format|
      if @it_asset.save
        format.html { redirect_to it_asset_url(@it_asset), notice: "It asset was successfully created." }
        format.json { render :show, status: :created, location: @it_asset }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @it_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /it_assets/1 or /it_assets/1.json
  def update
    respond_to do |format|
      if @it_asset.update(it_asset_params)
        format.html { redirect_to it_assets_url, notice: "It asset was successfully updated." }
        format.json { render :show, status: :ok, location: @it_asset }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @it_asset.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /it_assets/1 or /it_assets/1.json
  def destroy
    @it_asset.destroy!

    respond_to do |format|
      format.html { redirect_to it_assets_url, notice: "It asset was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_it_asset
      @it_asset = ItAsset.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def it_asset_params
      params.require(:it_asset).permit(:username, :asset_subtype, :barcode, :asset_name, :notes, :password, :distributed_at, :returned_at, :asset_type, :location, :damaged)
    end
end
