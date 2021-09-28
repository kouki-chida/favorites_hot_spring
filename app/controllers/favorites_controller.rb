class FavoritesController < ApplicationController
before_action :authenticate_user!

def create
  @hot_spring = HotSpring.find(params[:hot_spring_id])
  favorite = @hot_spring.favorites.new(user_id: current_user.id)
  favorite.save
end

def destroy
  @hot_spring = HotSpring.find(params[:hot_spring_id])
  favorite = @hot_spring.favorites.find_by(user_id: current_user.id)
  favorite.destroy
end
end
