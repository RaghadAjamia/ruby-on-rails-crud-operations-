class PowerbanksController < ApplicationController

  def index
    @power_banks = PowerBank.all
  end

  def show
    @power_bank = PowerBank.find(params[:id])

  end

  def new
    @power_bank = PowerBank.new
  end

  def create
    @power_bank = PowerBank.new(power_bank_params)
    if @power_bank.save
      redirect_to powerbanks_path, notice: 'Power bank was successfully created.'
    else
      render :new
    end
  end

  def edit
    @power_bank = PowerBank.find(params[:id])

  end

  def update
    if @power_bank.update(power_bank_params)
      redirect_to @power_bank, notice: 'Power bank was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @power_bank.destroy
    redirect_to power_banks_url, notice: 'Power bank was successfully destroyed.'
  end

  private

  def set_power_bank
    @power_bank = PowerBank.find(params[:id])
  end

  def power_bank_params
    params.require(:power_bank).permit(:serial_number, :locatable_id, :locatable_type)
  end
end
