class BooksController < ApplicationController

  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save then
      redirect_to book_path(@book), notice: 'メッセージが送信されました'
    else
      @books = Book.all
      render :index
    end
  end

  def destroy
  end

  def edit
    @book = Book.find(params[:id])
  end

  def index
    @book_new = Book.new
    @books = Book.all
  end

  def show
    @book_new = Book.new
    @book = Book.find(params[:id])
  end

  def update
  end

  private
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
