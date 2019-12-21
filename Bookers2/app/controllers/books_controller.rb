class BooksController < ApplicationController
    before_action :login_check, only: [:edit, :update, :destroy]
    
def home
    
end

def about
  
end

def index
        
         @bookx = Book.new
         @books = Book.all
    end

    def create
        @bookx = Book.new(book_params)
         @books = Book.all
    @bookx.user_id = current_user.id
    if @bookx.save
    redirect_to book_path(@bookx), notice: "You have creatad book successfully."
    else
          render :index
        end
    end
    
    def show
    	@book = Book.find(params[:id])
        @bookx = Book.new
       @user = User.find_by(id: @book.user_id)
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
        if @book.update(book_params)
    redirect_to book_path(@book), notice: "You have updated book successfully."
  else
    render :edit
  end
end

def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path

end


private
    def book_params
        params.require(:book).permit( :title, :body)
    end

    def login_check
        @book = Book.find(params[:id])
      unless  @book.user.id == current_user.id
    flash[:alert] = "ログインしてください"
    redirect_to books_path
end
  end
end