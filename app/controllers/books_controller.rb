class BooksController < ApplicationController
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]

  def create
   @book = Book.new(book_params)
   @book.user_id = current_user.id
   if @book.save
      redirect_to book_path(@book), notice: 'You have created book successfully.'
   else
      @books = Book.all
      @user = current_user
      @nbook = Book.new
      render 'index'
   end
 end

 def show
   @nbook = Book.new
   @user = current_user
   @book = Book.find(params[:id])
 end
 def edit
 	@book = Book.find(params[:id])
 end

 def update
 	@book = Book.find(params[:id])
  	if @book.update(book_params)
    redirect_to book_path(@book), notice: 'Book was successfully updated.'
    else
    render 'edit'
    end
 end

 def correct_user
  @book = Book.find(params[:id])
  if @book.user_id != current_user.id
    redirect_to books_path
  end
 end

 def destroy
    @book = Book.find(params[:id])
  	@book.destroy
  	redirect_to books_path(@book)
  end

 def index
   @user = current_user
   @nbook = Book.new
   @books = Book.all
   @book = Book.new
 end



 private

  def book_params
  	params.require(:book).permit(:title, :body, :introduction)
  end

end
