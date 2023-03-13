class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy charge ]

  before_action :authenticate_user!
  # layout 'application'




  def dash
    # render vehicles
  end

  # GET /vehicles or /vehicles.json
  def index

    @vehicles = Vehicle.search(params[:search]).paginate(page: params[:page], per_page: 6)
  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
    # p params
    # if params. == true then
      @charges = Charge.all.pluck(:vehicle_type)
      @vehicle = Vehicle.new
    # end
  end

  # GET /vehicles/1/edit
  def edit
    @charges = Charge.all.pluck(:vehicle_type)
  end

  # POST /vehicles or /vehicles.json
  def create
    # binding.pry
      @vehicle = Vehicle.new(vehicle_params)


    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully created." }
        format.json { render :show, status: :created, location: @vehicle }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vehicles/1 or /vehicles/1.json
  def update
    respond_to do |format|
      if @vehicle.update(vehicle_params)
        format.html { redirect_to vehicle_url(@vehicle), notice: "Vehicle was successfully updated." }
        format.json { render :show, status: :ok, location: @vehicle }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vehicles/1 or /vehicles/1.json
  def destroy
    @vehicle.destroy

    respond_to do |format|
      format.html { redirect_to vehicles_url, notice: "Vehicle was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:vehicle_type, :number, :in_time, :out_time, :charges, :status, :user_id, :owner)
    end
end
