class CategoriesController < ApplicationController
  
  # def create
  #     @category = Category.new(category_params)
      
  #     # if @category.save
  #     #   uploaded_file = params[:category][:picture]
  #     #   unless uploaded_file.nil?
  #     #     new_file_path = Rails.root.join('public', 'uploads', 'categories', @category.id.to_s)
  #     #     File.open(new_file_path, "wb")  do |file|
  #     #     file.write uploaded_file.read
  #     #     end
  #     #   end   
  #     #   redirect_to admin_categories_path
  #     # else
  #     #   render 'new'
  #     # end

  #   end

  #   def new
  #     @category = Category.new
  #   end

   
    def show
      @categories = Category.all
      @category = Category.find(params[:id])
      @books = @category.books
    end

    # def edit
    #   @category = Category.find(params[:id])
    # end

    # def update
    #   @category = Category.find(params[:id])
    #   if @category.update(category_params)
    #     redirect_to admin_categories_path
    #   else
    #     render 'edit'
    #   end
    # end

    # def destroy
    #   @category = Category.destroy(params[:id])
    #   redirect_to admin_categories_path
    # end




    private

    def category_params
      params.require(:category).permit(:title)
    end


  

end
