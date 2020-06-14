class BooksController < ApplicationController
  def index
    @books = Book.order(:id)
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.save!
    redirect_to root_url
  rescue ActiveRecord::RecordInvalid
    @books = Book.order(:id)
    render :index
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end