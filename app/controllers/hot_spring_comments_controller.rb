class HotSpringCommentsController < ApplicationController
def create
    @hot_spring = HotSpring.find(params[:hot_spring_id])
    @hot_spring_comment = HotSpringComment.new(hot_spring_comment_params)
    @hot_spring_comment.hot_spring_id = @hot_spring.id
    @hot_spring_comment.user_id = current_user.id
  unless  @hot_spring_comment.save!
    render 'error'
  end
end

  def destroy
   @hot_spring = HotSpring.find(params[:hot_spring_id])
    hot_spring_comment = @hot_spring.hot_spring_comments.find(params[:id])
    hot_spring_comment.destroy
  end

  private

  def hot_spring_comment_params
    params.require(:hot_spring_comment).permit(:comment)
  end

end
