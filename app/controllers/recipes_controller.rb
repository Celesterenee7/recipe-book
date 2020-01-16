class RecipesController < ApplicationController
  def index
    @recipe_search = Recipe.where("name ilike '%#{params[:search]}%'").uniq
    @recipes = Recipe.all
    @food_tags = FoodTag.all
    render :index
  end

  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  def new
    @recipe = Recipe.new
    render :new
  end

  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @tag =  FoodTag.find(params[:food_tags].fetch("id"))
    @recipe.food_tags << @tag
    if @recipe.save
      flash[:notice] = "Recipe successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  def update
      @recipe= Recipe.find(params[:id])
      @tag =  FoodTag.find(params[:food_tags].fetch("id"))
      @recipe.food_tags.delete_all
      @recipe.food_tags << @tag
      if @recipe.update(recipe_params)
        redirect_to recipes_path
      else
        render :edit
      end
    end

  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :rating, :instruction, :search)
    end
end
