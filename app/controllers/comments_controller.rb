class CommentsController < ApplicationController
  def new

  end
  def create
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.create(comment_params.merge(user:@user))
    redirect_to user_post_path(@user, @post)
  end
  def destroy
    @user = User.find(params[:user_id])
    @post = @user.posts.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to user_post_path(@user, @post), status: :see_other
  end
  private
    def comment_params
      params.require(:comment).permit(:commenter, :content)
    end
end
