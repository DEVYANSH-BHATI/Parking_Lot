class VehiclesController < ApplicationController
  before_action :set_vehicle, only: %i[ show edit update destroy charge leaving leaved ]
  before_action :set_vehicle_type, only: %i[ new edit create ]

  before_action :authenticate_user!
  # layout 'application'


  def leaving
    # binding.pry
    # @readable_total_hours2  = Human_time::seconds_to_string(@vehicle.out_time - @vehicle.in_time)

    # binding.pry
    # pp @charges.inspect
    # pp @vehicle.inspect
    # @vehicle.put_charges(@charges.min_charge,@charges.min_hours,@charges.extra_hour_charges,(-1)*( @vehicle.in_time - DateTime.now )/3600)
    # self.put_out_time

  end

  def leaved
    @vehicle.out_time = DateTime.now.utc.in_time_zone('Asia/Kolkata')

    @charges = Charge.find_by_vehicle_type(@vehicle.vehicle_type)
    # @readable_total_hours2  = Human_time::seconds_to_string(@vehicle.out_time - @vehicle.in_time)
    @vehicle.put_charges(@charges.min_charge,@charges.min_hours,@charges.extra_hour_charges,@vehicle.in_time,@vehicle.out_time)

    respond_to do |format|
      if @vehicle.save
        format.html { redirect_to vehicles_url, notice: "Vehicle successfully left the parking lot." }
      # else
      #   format.html { render :new, status: :unprocessable_entity }
      #   format.json { render json: @vehicle.errors, status: :unprocessable_entity }
      end

    end
  end


  def dash
    # render vehicles
  end

  # GET /vehicles or /vehicles.json
  def index
    @vehicles = Vehicle.search(params[:search]).paginate(page: params[:page], per_page: 6)
    if params[:status].present?
      @vehicles = Vehicle.where(status: params[:status]).paginate(page: params[:page], per_page: 6)
    elsif params[:owner].present?
      @vehicles = Vehicle.order(owner: :desc).paginate(page: params[:page], per_page: 6)
    end
  end

  # def category
  #   if params[:status].present?
  #     @vehicles = Vehicle.where(status: params[:status])
  #   else
  #     @vehicles=Vehicle.all
  #   end
  # end

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

