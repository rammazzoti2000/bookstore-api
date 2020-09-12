class BooksController < ApplicationController
  before_action :set_book, only: [:show, :update, :destroy]
  skip_before_action :verify_authenticity_token
  before_action :logged_in?

  # GET /books
  def index
    @books = Book.all
    if @books
      render json: {
        code: 200,
        data: Book.all.as_json
      }
    else
      render json: {
        code: 400,
        errors: @books.errors.messages
      }
    end
  end

  # GET /books/1
  def show
    @book = Book.find(params[:id])
    if @reading
      render json: {
        code: 200,
        data: @book.as_json
      }
    else
      render json: @book.errors
    end
  end

  # POST /books
  def create
    @book = current_user.books.build(book_params)
    if @book.save
      render json: {
        code: 200
      }
    else
      render json: {
        code: 400,
        errors: @user.errors.messages
      }
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
