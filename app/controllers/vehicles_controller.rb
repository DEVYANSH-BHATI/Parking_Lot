class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy charge leaving ]
  before_action :set_vehicle_type, only: %i[ new edit create ]

  before_action :authenticate_user!
  # layout 'application'


  def leaving
    # binding.pry
    @charges = Charge.find_by_vehicle_type(@vehicle.vehicle_type)
    # pp @charges.inspect
    # pp @vehicle.inspect
    pp self , 'asdfsdfsdf'
    @vehicle.put_charges(@charges.min_charge,@charges.min_hours,@charges.extra_hour_charges,(-1)*( @vehicle.in_time - DateTime.now )/3600)
    # self.put_out_time



  end


  def dash
    # render vehicles
  end

  # GET /vehicles or /vehicles.json
  def index

    @vehicles = Vehicle.search(params[:search])

  end

  # GET /vehicles/1 or /vehicles/1.json
  def show
  end

  # GET /vehicles/new
  def new
      @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
    # binding.pry
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
  def set_vehicle_type
    @vehicle_types = Charge.all.order(:vehicle_type).pluck(:vehicle_type)
  end
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
      @time_now = Time.new.strftime("%Y-%m-%dT%k:%M")
    end

    # Only allow a list of trusted parameters through.
    def vehicle_params
      params.require(:vehicle).permit(:vehicle_type, :number, :in_time, :out_time, :charges, :status, :user_id, :owner)
    end
end
