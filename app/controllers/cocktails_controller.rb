class CocktailsController < ApplicationController
  
  def index
    @cocktails = Cocktail.all
  end
  
 def show
   @cocktail = Cocktail.find(params[:id])
 end
 
 
 
  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(cocktail_params)
    if @cocktail.save
      flash[:success] = "Creado Con exito"
      redirect_to @cocktail
    else
      flash[:error] = "Intenta nuevamente"
      render 'new'
    end
  end
  
  def destroy
    @cocktail = Cocktail.find(params[:id])
    if @cocktail.destroy
      flash[:success] = 'Eliminado con exito'
      redirect_to cocktails_url
    else
      flash[:error] = 'No se pudo eliminar'
      redirect_to cocktails_url
    end
  end
  

  private
  def cocktail_params
    params.require(:cocktail).permit (:name)
  end
  
  
end
