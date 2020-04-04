class SentencesController < ApplicationController
  def new
    @sentence = Sentence.new
  end

  def create
    @sentence = Sentence.new(sentence_params)
    @sentence.charge = Charge.find(params[:charge_id])

    if @sentence.save
      redirect_to request.referer
    else
      render :new
    end
  end

  def destroy
    @sentence.destroy
    redirect_to request.referer
  end

  private

  def sentence_params
    params.require(:sentence).permit(:name, :charge)
  end
end
