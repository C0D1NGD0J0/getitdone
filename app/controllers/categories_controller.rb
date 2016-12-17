class CategoriesController < ApplicationController
	before_action :authenticate_user!

  def create
  	@category = Category.new(category_params)
  	if @category.save
  		flash[:success] = 'Category has been created'
  		redirect_to root_path
  	else
  		redirect_back(fallback_location: root_path)
  	end
  end

  private
  	def category_params
  		params.require(:category).permit(:name)
  	end
end
