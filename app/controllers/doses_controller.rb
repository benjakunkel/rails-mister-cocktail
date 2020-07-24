class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end
  
  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredient = Ingredient.find(params[:dose][:ingredient_id])
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose = Dose.find(params[:id])
    if @dose.destroy
      flash[:success] = 'Eliminado.'
      redirect_to cocktail_path(params[:cocktail_id])
    else
      flash[:error] = 'No es posible'
      redirect_to doses_url
    end
  end
  

  private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end





















