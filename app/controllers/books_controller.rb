class BooksController < ApplicationController
  def index
    @books = Book.all
    @book = Book.new
  end


  def show
    @book = Book.find(params[:id])
  end

  def new
  end

  def create
    @book = Book.new(book_params)
    @books = Book.all
    if @book.save
      flash[:notice]= "Book was successfully created"
      redirect_to book_path(@book.id)
    else
      render :index
    end
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:notice] = "Book was successfully update"
      redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      flash[:notice] = "Book was successfully destroy"
    redirect_to books_path
    else
      render action: :index
    end
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
