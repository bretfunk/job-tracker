class CategoriesController < ApplicationController
  # before_action :set_category, only [:update, :delete, :edit, :show]

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])
  end

  def new
    @category = Category.new
  end

  def edit
    @category = Category.find(params[:id])
  end
  def create
    @category = Category.new(category_params)

    if @category.save
      flash.notice ="category '#{@category.name}' Saved!"

      redirect_to category_path(@category)
    else
      render :new
    end

  end

  def update
    @category = Category.find(params[:id])
    @category.update(category_params)

    flash.notice = "Category Updated!"

    redirect_to category_path(@category)
  end

  def destroy
    @category = Category.find(params[:id])
    @category.destroy

    flash.notice = "category #{@category.name} Deleted!"

    redirect_to categories_path
  end

  private

  def set_category
    @category = Category.find(params[:id])
  end

  def category_params
    params.require(:category).permit(:name)
  end
end
