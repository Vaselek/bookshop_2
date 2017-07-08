class BooksController < ApplicationController
  

  def create
    @book = Book.new(book_params)
    @book.user = current_user

    @book.category_ids << params[:category_ids]
    @book.author_ids << params[:author_ids]


    if @book.save
      redirect_to books_path(@book)
    else
      render 'new'
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
    @rate = Rate.new
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
    params.require(:book).permit(:title, :author_ids, :category_ids, :file)
  end

end
