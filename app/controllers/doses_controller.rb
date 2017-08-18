class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[cocktail_id])
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(dose_params)
    @dose.cocktail = Cocktail.find(params[cocktail_id])
    @dose.save

    redirect_to dose_path(@dose)
  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy

    redirect_to doses_path
  end

  private

  def dose_params
    params.require(:dose).permit(:name, :content)
  end
end
