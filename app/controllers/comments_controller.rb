class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    @comment.commentable_id = params[:commentable_id]
    @comment.commentable_type = params[:commentable_type]

    if @comment.save
      redirect_to students_path
    else
      render :new
    end
  end

  def delete
    @comment = Comment.find_by(commentable_id: params[:commentable_id]).destroy
    redirect_to students_path
  end

  private
  def comment_params
    params.require(:comment).permit(:body)
  end
end
