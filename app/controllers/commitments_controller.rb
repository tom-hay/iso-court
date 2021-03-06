class CommitmentsController < ApplicationController
  before_action :set_commitment, only: :destroy

  def new
    @commitment = Commitment.new
  end

  def create
    @commitment = Commitment.new(commitment_params)

    if @commitment.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @commitment.destroy

    redirect_to request.referer
  end

  private

  def set_commitment
    @commitment = Commitment.find(params[:id])
  end

  def commitment_params
    params.require(:commitment).permit(:category, :description)
  end
end
