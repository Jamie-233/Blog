class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    # @comment = @post.comments.create(params[:comment].permit(:name, :comment))

    @comment = @post.comments.create(params.require(:comment).permit(:name, :comment))
    

  end

  def destroy
    @post = Post.find(params[:post_id])
    @comment = @post.comments.find(params[:id])
    @comment.destroy
    redirect_to post_path(@post)
  end

end
