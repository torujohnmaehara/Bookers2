class UsersController < ApplicationController

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      redirect_to book_path(@book), notice: 'Book was successfully created.'
   else
      @books = Book.all
      render 'index'
   end
  end

  def show
    @aaa = Book.new
    @user = User.find(params[:id])
    @books = @user.books
  end

  def index
    @user = current_user
    @aaa = Book.new
    @users = User.all
  end


  def edit
    @user = User.find(params[:id])
  end
 
  def update
  	@user = User.find(params[:id])
  	@user.update(user_params)
  	redirect_to user_path(@user.id)
  end

  private

  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end