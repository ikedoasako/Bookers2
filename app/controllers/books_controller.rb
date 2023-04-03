class BooksController < ApplicationController
    def index
      @books = Book.all
      @book = Book.new
      @user = current_user
    end

    def show
      @book = Book.find(params[:id])
      @user = @book.user
    end

    def create
      @user = current_user
      @book = Book.new(book_params)
      @book =Book.create(content: post_params[:content], title: post_params[:title], user_id: current_user.id)
      if @book.save
        redirect_to book_path
      end
      @book.user_id = current_user.id
      if @book.save
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
      else
        @books = Book.all
        render :index
      end
    end

    def edit
      @book = Book.find(params[:id])
      @book.user_id = current_user.id
    end

    def update
      @book = Book.find(params[:id])
      if @book.update(book_params)
        flash[:notice] = "successfully"
        redirect_to book_path(@book.id)
      else
        render :edit
      end
    end

    def destroy
      book = Book.find(params[:id])
      book.destroy
      redirect_to books_path
    end

    private

    def book_params
      params.require(:book).permit(:title, :opinion)
    end
end
