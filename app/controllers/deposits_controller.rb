class DepositsController < ApplicationController
  before_action :set_deposit, only: %i[ show edit update destroy ]

  # GET /deposits or /deposits.json
  def index
    @deposits = Transaction.with_types(:deposit)
  end

  # GET /deposits/1 or /deposits/1.json
  def show
  end

  # GET /deposits/new
  def new
    @deposit = Transaction.new
  end

  # GET /deposits/1/edit
  def edit
  end

  # POST /deposits or /deposits.json
  def create
    @deposit = Transaction.new(deposit_params)
    @deposit.types = "deposit"
    @deposit.source_type = "Stock"
    @deposit.target_type = "Account"
    respond_to do |format|
      if @deposit.save
        format.html { redirect_to deposit_url(@deposit), notice: "Deposit was successfully created." }
        format.json { render :show, status: :created, location: @deposit }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /deposits/1 or /deposits/1.json
  def update
    respond_to do |format|
      if @deposit.update(deposit_params)
        format.html { redirect_to deposit_url(@deposit), notice: "Deposit was successfully updated." }
        format.json { render :show, status: :ok, location: @deposit }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @deposit.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_deposit
      @deposit = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def deposit_params
      params.require(:transaction).permit(:source_id, :target_id, :amount)
    end
end
