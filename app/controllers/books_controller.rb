class BooksController < ApplicationController
  

  def create
    uploaded_file = params[:book][:picture]
    if uploaded_file.nil?
      render 'new'
    else
    @book = Book.new(book_params)
    @book.user = current_user
    @book.save
    @book_image = @book.book_images.create!(user: @current_user)
    new_file_path = Rails.root.join('public', 'uploads', 'book_image', 'file', @book_image.id.to_s)
    # File.open(new_file_path, "wb")  do |file|
    #   file.write uploaded_file.read
    # end
    File.open(new_file_path) do |f|
      @book_image.file = f
    end
      redirect_to books_path(@book)
    end

  end

  def search
    search = params[:search]
    @books = Book.where("title like ? OR description like ?", "%#{search}%", "%#{search}%").order('id DESC')
  end

  def new
    @book = Book.new
  end

  def index
    @books = Book.all
    @categories = Category.all
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      redirect_to books_path
    else
      render 'edit'
    end
  end

  def destroy
    @book = Book.destroy(params[:id])
    redirect_to books_path
  end


  private

  def book_params
    params.require(:book).permit(:title, :author_id, :category_id)
  end

end
