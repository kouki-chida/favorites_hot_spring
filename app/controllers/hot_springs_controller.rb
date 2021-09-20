class HotSpringsController < ApplicationController
def index
 @new_hot_spring = Hot_spring.new
 @hot_springs = Hot_spring.all
 @user = current_user
end


def show
 @new_hot_spring = Hot_spring.new
 @hot_spring = Hot_spring.find(params[:id])
 @user = current_user
 
end

def edit
 @hot_spring = Hot_spring.find(params[:id])
 @user = current_user
end

def create
@new_hot_spring = Hot_spring.new(hot_spring_params)

end

def update
@hot = Hot_spring.find(params[:id])

end

private
  # ストロングパラメータ
  def hot_spring_params
    params.require(:hot_spring).permit(:title, :body)
  end


end