class CommentsController < ApplicationController
  before_action :authenticate_user!
  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(params[:comment].permit(:content))
    # @comment = Comment.create(params[:comment].permit(:content))
    @comment.post_id = @post.id
    @comment.user_id = current_user.id

    if @comment.save
      redirect_to post_path(@post)
    else
      render 'new'
    end
  end
end
