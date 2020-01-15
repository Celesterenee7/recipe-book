class RecipesController < ApplicationController
  # before_action :set_recipe, only: [:show, :edit, :update, :destroy]

  # GET /recipes
  # GET /recipes.json
  def index
    @recipes = Recipe.all
    render :index
  end

  # GET /recipes/1
  # GET /recipes/1.json
  def show
    @recipe = Recipe.find(params[:id])
    render :show
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    render :new
  end

  # GET /recipes/1/edit
  def edit
    @recipe = Recipe.find(params[:id])
    render :edit
  end

  # POST /recipes
  # POST /recipes.json
  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      flash[:alert] = "Recipe successfully added!"
      redirect_to recipes_path
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  # PATCH/PUT /recipes/1.json
  def update
      @recipe= Recipe.find(params[:id])
      if @recipe.update(recipe_params)
        redirect_to recipes_path
      else
        render :edit
      end
    end

  # DELETE /recipes/1
  # DELETE /recipes/1.json
  def destroy
    @recipe = Recipe.find(params[:id])
    @recipe.destroy
    redirect_to recipes_path
  end

  private
    def recipe_params
      params.require(:recipe).permit(:name, :rating, :instruction)
    end

end
