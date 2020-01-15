class IngredientsController < ApplicationController
  def new
    @recipe = Recipe.find(params[:recipe_id])
    @ingredient = @recipe.ingredients.new
    render :new
  end


def create
  @recipe = Recipe.find(params[:recipe_id])
  @ingredient = @recipe.ingredients.new(ingredient_params)
  if @ingredient.save
    redirect_to recipe_path(@recipe)
  else
    render :new
  end
end

def show
  @recipe = Recipe.find(params[:recipe_id])
  @ingredient = Ingredient.find(params[:id])
  render :show
end

def edit
  @recipe = Recipe.find(params[:recipe_id])
  @ingredient = Ingredient.find(params[:id])
  render :edit
end

def update
  @ingredient = Ingredient.find(params[:id])
  if @ingredient.update(ingredient_params)
    redirect_to recipe_path(@ingredient.recipe)
  else
    render :edit
  end
end

def destroy
  @ingredient = Ingredient.find(params[:id])
  @ingredient.destroy
  redirect_to recipe_path(@ingredient.recipe)
end

# Other controller actions go here.

private
  def ingredient_params
    params.require(:ingredient).permit(:name)
  end
end
