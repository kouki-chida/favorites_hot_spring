class HotSpringsController < ApplicationController
before_action :authenticate_user!


def index
 @new_hot_spring = HotSpring.new
 @hot_springs = HotSpring.all
 @user = current_user
end


def show
 @new_hot_spring = HotSpring.new
 @hot_spring = HotSpring.find(params[:id])
 @user = current_user
 @hot_spring_comment = HotSpringComment.new
end

def edit
 @hot_spring = HotSpring.find(params[:id])
 @user = current_user
 if @hot_spring.user != current_user
    redirect_to hot_springs_path
 end
end


def create
      @new_hot_spring = HotSpring.new(hot_spring_params)
      @new_hot_spring.user_id = current_user.id
      @user =current_user
    if @new_hot_spring.save
      flash[:notice] = "You have created hot_spring successfully."
      redirect_to hot_spring_path(@new_hot_spring.id)
    else
      @hot_springs = HotSpring.all
      flash.now[:danger] = "error"
      render :index
    end
end

def update
       @hot_spring = HotSpring.find(params[:id])
       if @hot_spring.update(hot_spring_params)
        flash[:notice] = "You have updated book successfully."
        redirect_to hot_spring_path(@hot_spring.id)
       else
        flash.now[:danger] = "error"
        render :edit
       end
end

def destroy
    @hot_spring = HotSpring.find(params[:id])
    @hot_spring.destroy
    redirect_to hot_springs_path
end



private
  # ストロングパラメータ
  def hot_spring_params
    params.require(:hot_spring).permit(:hot_spring_name, :text)
  end


end