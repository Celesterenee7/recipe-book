class FoodTagsController < ApplicationController
  def index
    @food_tags = FoodTag.all
    render :index
  end

  def show
    @food_tag = FoodTag.find(params[:id])
    render :show
  end

  def new
    @food_tag = FoodTag.new
    render :new
  end

  def edit
    @food_tag = FoodTag.find(params[:id])
    render :edit
  end

  def create
    @food_tag = FoodTag.new(food_tag_params)
    if @food_tag.save
      flash[:notice] = "Tag successfully added!"
      redirect_to food_tags_path
    else
      render :new
    end
  end

  def update
    @food_tag = FoodTag.find(params[:id])
    if @food_tag.update(food_tag_params)
      redirect_to food_tags_path
    else
      render :edit
    end
  end

  def destroy
    @food_tag = FoodTag.find(params[:id])
    @food_tag.destroy
    redirect_to food_tags_path
  end

  private
  def food_tag_params
    params.require(:food_tag).permit(:name)
  end

end
