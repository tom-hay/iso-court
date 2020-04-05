class ChargesController < ApplicationController
  before_action :set_charge, only: :destroy

  def new
    @charge = Charge.new
  end

  def create
    @charge = Charge.new(charge_params)

    if @charge.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @charge.destroy

    redirect_to request.referer
  end

  private

  def set_charge
    @charge = Charge.find(params[:id])
  end

  def charge_params
    params.require(:charge).permit(:category, :description, :user_id)
  end
end
