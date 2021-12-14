class UsersController < ApplicationController
 def index
    @users = User.all
    @user = current_user
    @book = Book.new
 end
 
  def show
    @users = User.all
    @user = User.find(params[:id])
    @book = Book.new
    @books = Book.where(user: @user)

  end
  
  def edit
    @user = current_user
  end
  
  def update
    @user = current_user
    @user.update(user_params)
    redirect_to users_index_path(@user.id)
  end
  
  def new
   @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id=current_user.id
    @book.save
    redirect_to books_path
  end
  
private
def user_params
  params.require(:user).permit(:name,:profile,:image)
end
end