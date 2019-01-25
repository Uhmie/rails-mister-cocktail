class DosesController < ApplicationController
  def new
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose = Dose.new
  end

  def create
    @cocktail = Cocktail.find(params[:cocktail_id])
    @ingredients = Ingredient.find(params[:dose][:ingredient])
    @ingredients.each do |ingredient|
      @dose = Dose.new(dose_params)
      @dose.cocktail = @cocktail
      @dose.ingredient = ingredient
      @dose.save
    end
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else render 'cocktails/show'
    end
  end

  private

  def dose_params
    params.require(:dose).permit(:description, :cocktail_id, :ingredient_id)
  end
end
