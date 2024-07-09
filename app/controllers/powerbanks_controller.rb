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
      redirect_to powerbanks_path
    else
      render :new
    end
  end

  def edit
    @power_bank = PowerBank.find(params[:id])
  end

  def update
    @power_bank = PowerBank.find(params[:id]) 
    if @power_bank.update(power_bank_params)
      redirect_to powerbanks_path
    else
      render :edit
    end
  end
  
  

  def userpowerbanks
    @power_banks = PowerBank.all
  end

  def destroy
    @power_bank = PowerBank.find(params[:id])
    @power_bank.destroy
    redirect_to powerbanks_path
  end

  private

  def power_bank_params
    params.require(:power_bank).permit(:serial_number, :locatable_type, :locatable_id, :status)
  end
end
