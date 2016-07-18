class CategoriesController < ContentController
  def show
    @category = Category.includes(:pages).find(params[:id])
  end
end
