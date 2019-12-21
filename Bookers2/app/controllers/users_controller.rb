class UsersController < ApplicationController
 
 before_action :login_check, only: [:edit, :update, :destroy]

def index
  @users = User.all
  @bookx = Book.new
end

  def show
  	@user = User.find(params[:id]) # ここを記述
  	  @books = @user.books.all
  	  @bookx = Book.new
        
  end

  def edit
        @user = User.find(params[:id])
         @bookx = Book.new
    end

    	def update
    @user = User.find(params[:id])
    if @user.update(user_params)
    redirect_to user_path(@user.id), notice: "You have updated user successfully."
  else
    render :edit
  end

end
private 
def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
end

 def login_check
        @user = User.find(params[:id])
      unless  @user.id == current_user.id
    flash[:alert] = "ログインしてください"
    redirect_to user_path(current_user.id)
end
  end
end