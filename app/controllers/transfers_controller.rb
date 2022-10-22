class TransfersController < ApplicationController
  before_action :set_transfer, only: %i[ show edit update destroy ]

  # GET /transfers or /transfers.json
  def index
    @transfers = Transaction.with_types(:transfer)
  end

  # GET /transfers/1 or /transfers/1.json
  def show
  end

  # GET /transfers/new
  def new
    @transfer = Transaction.new
  end

  # GET /transfers/1/edit
  def edit
  end

  # POST /transfers or /transfers.json
  def create
    @transfer = Transaction.new(transfer_params)
    @transfer.types = "transfer"
    @transfer.source_type = "Account"
    @transfer.target_type = "Account"
    respond_to do |format|
      if @transfer.save
        format.html { redirect_to transfer_url(@transfer), notice: "Transfer was successfully created." }
        format.json { render :show, status: :created, location: @transfer }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /transfers/1 or /transfers/1.json
  def update
    respond_to do |format|
      if @transfer.update(transfer_params)
        format.html { redirect_to transfer_url(@transfer), notice: "Transfer was successfully updated." }
        format.json { render :show, status: :ok, location: @transfer }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @transfer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_transfer
      @transfer = Transaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def transfer_params
      params.require(:transaction).permit(:source_id, :target_id, :amount)
    end
end
