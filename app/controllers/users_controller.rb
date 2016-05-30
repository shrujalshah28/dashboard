class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:success] = "Welcome to Dashboard #{@user.username}"
      #redirect_to users_path
      render 'new'
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
      
    if @user.update(user_params)
      flash[:success] = "Your account was updated successfullly"
      #redrict_to users_path
      render 'new'
    else
      render 'edit'  
    end
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

end