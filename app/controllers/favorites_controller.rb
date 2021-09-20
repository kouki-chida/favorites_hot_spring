class FavoritesController < ApplicationController

def create
  hot_spring = Hot_spring.find(params[:hot_spring_id])
  favorite = current_user.favorites.new(hot_spring_id: hot_spring.id)
  favorite.save
  redirect_back(fallback_location: root_path)

end

def destroy
  hot_spring = Hot_spring.find(params[:hot_spring_id])
  favorite = current_user.favorites.find_by(hot_spring_id: hot_spring.id)
  favorite.destroy
  redirect_back(fallback_location: root_path)

end
end
