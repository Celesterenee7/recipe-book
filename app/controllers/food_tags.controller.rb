class FoodTagsController < ApplicationController
  def show
    @food_tag = FoodTag.find(params[:id])
    render :show
  end
end
