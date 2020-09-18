class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  before_action :logged_in?

  # GET /books
  def index
    @books = Book.all
    if @books
      render json: @books
    else
      render json: @books.errors, status: :unprocessable_entity
    end
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
    if @book
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # POST /books
  def create
    @book = current_user.books.build(book_params)

    if @book.save
      render json: @book, status: :created, location: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    if @book.update(book_params)
      render json: @book
    else
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # DELETE /books/1
  def destroy
    @book.destroy
  end

  def user_books
    @user_books = Book.where(user_id: params[:id])
    if @user_books
      render json: @user_books
    else
      render json: @user_books.errors, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_book
      @book = Book.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def book_params
      params.require(:book).permit(:id, :title, :author, :category, :pages, :progress)
    end
end
