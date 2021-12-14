class BooksController < ApplicationController
  def index
    @book = Book.new
    @books = Book.all.order(created_at: :desc)
  end

  def show
     @book = Book.new
     @book_id=Book.find(params[:id])
  end

  def new
    @book = Book.new
  end
  

  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    if @book.save
        flash[:notice] = "Book was successfully created." 
        redirect_to book_path(@book)
    else
      render "index"
    end
  end

  def edit
    @book=Book.find(params[:id])
  end
  
  def update
   @book=Book.find(params[:id])
    if @book.user == current_user
      if @book.update(book_params)
          flash[:notice] = "Book was successfully updated." 
          redirect_to book_path(@book)
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