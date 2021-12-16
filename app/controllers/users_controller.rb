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
    @user_id =User.find(params[:id])
    if @user_id == current_user
      render "edit"
    else
      redirect_to user_path(@user)
    end
   
  end
  
  def update
    @user = current_user
    if @user == current_user
      if @user.update(user_params)
          redirect_to user_path(@user), notice: "You have updated user successfully." 
      else
        render 'edit'
      end
    end
  end
  
  def new
   @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @user = current_user
    @book.user_id=current_user.id
    if @book.save
        redirect_to books_path, notice: "Book was successfully  created." 
    else
        render :show
    end
  end
  
private
def user_params
  params.require(:user).permit(:name,:introduction,:profile_image)
end
end