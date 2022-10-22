class WithdrawsController < ApplicationController
  before_action :set_withdraw, only: %i[ show edit update destroy ]

  # GET /withdraws or /withdraws.json
  def index
    @withdraws = Transaction.with_types(:withdraw)
  end

  # GET /withdraws/1 or /withdraws/1.json
  def show
  end

  # GET /withdraws/new
  def new
    @withdraw = Transaction.new
  end

  # GET /withdraws/1/edit
  def edit
  end

  # POST /withdraws or /withdraws.json
  def create
    @withdraw = Transaction.new(withdraw_params)
    @withdraw.types = "withdraw"
    @withdraw.source_type = "Account"
    @withdraw.target_type = "Stock"
    respond_to do |format|
      if @withdraw.save
        format.html { redirect_to withdraw_url(@withdraw), notice: "Withdraw was successfully created." }
        format.json { render :show, status: :created, location: @withdraw }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /withdraws/1 or /withdraws/1.json
  def update
    respond_to do |format|
      if @withdraw.update(withdraw_params)
        format.html { redirect_to withdraw_url(@withdraw), notice: "Withdraw was successfully updated." }
        format.json { render :show, status: :ok, location: @withdraw }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @withdraw.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_withdraw
      @withdraw = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def withdraw_params
      params.require(:transaction).permit(:source_id, :target_id, :amount)
    end
end
