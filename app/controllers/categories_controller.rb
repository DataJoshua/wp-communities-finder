class CategoriesController < ApplicationController
  before_action -> { authorize! Category }
  before_action :set_categories

  expose :categories, ->{ Category.all }

  def index
  end

  def show
    @category = Category.find(params[:id])
    @q = @category.communities.ransack(params[:q])
    @communities = @q.result
                     .page(params[:page])
                     .per(5)
  end

  private

  def set_categories
    @categories = Category.all
  end

end
