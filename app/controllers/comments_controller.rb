class CommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
  end

  def destroy
    
  end
end
