class UsersController < ApplicationController
  def index
    @users =User.all
    @hot_spring = HotSpring.new
    @user = current_user
  end

  def show
    @new_hot_spring = HotSpring.new
    @user =User.find(params[:id])
  end

  def edit
   @user = User.find(params[:id])
   if @user != current_user
   redirect_to user_path(current_user)
   end
  end

  def update
   @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private
  # ストロングパラメータ
  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction)
  end


end
