class BooksController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :render_404

  def index
    @books = Book.order(:id)
    @book = Book.new
  end

  def create
    @book = Book.new book_params
    @book.save!
    redirect_to book_url(@book), notice: 'Book was successfully created.'
  rescue ActiveRecord::RecordInvalid
    @books = Book.order(:id)
    render :index
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    @book = Book.find(params[:id])
    @book.update!(book_params)
    redirect_to book_url(@book), notice: 'Book was successfully updated.'
  rescue ActiveRecord::RecordInvalid
    render :edit
  end

  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully deleted.'
  end

  private
   def book_params
     params.require(:book).permit(:title, :body)
   end
end
