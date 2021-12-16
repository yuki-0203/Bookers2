class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.page(params[:page]).reverse_order
    @user = current_user
    
  end

  def show
     @book = Book.new
     @book_id = Book.find(params[:id])
     @user = @book_id.user
  end

  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @books = Book.all
    @books = @books.page(params[:page])
    @user = current_user
    if @book.save
        redirect_to book_path(@book),notice:"Book was successfully created." 
    else
      render "index"
    end
  end

  def edit
    @book=Book.find(params[:id])
    if @book.user == current_user
      render "edit"
    else
      redirect_to books_path
    end
  end
  
  
  def update
   @book=Book.find(params[:id])
    if @book.user == current_user
      if @book.update(book_params)
          redirect_to book_path(@book), notice: "Book was successfully  updated." 
      else
          render "edit"
      end
    end
  end
  
  def destroy
  @book=Book.find(params[:id])
  if @book.user == current_user
    @book.destroy
  end
    redirect_to books_path
  end
  
  
    private

  def book_params
    params.require(:book).permit(:title,:body,:user)
  end
  
end