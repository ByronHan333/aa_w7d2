class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to blog_url(@comment.blog_id)
  end

  def destroy
    comment = Comment.find_by(id: params[:id])
    blog_id = comment.blog_id
    comment.destroy
    redirect_to blog_url(blog_id)
  end

  private

  def comment_params
    params.require(:comment).permit(:body, :blog_id, :author_id)
  end
end
