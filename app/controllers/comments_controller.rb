class CommentsController < ApplicationController

  def create
  @comment = Comment.new(comment_params)
  @comment.job_id = params[:job_id]

  @comment.save
  flash[:notice] = "Comment Added!"
# redirect_to companies_path
  redirect_to job_path(@comment.job)
  end

private

  def comment_params
  params.require(:comment).permit(:author, :body)
  end
end
