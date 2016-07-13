class CommentsController < ApplicationController
  before_action :consequences_of_not_logged_in

  def new
    @comment = Comment.new
    @post_id = params[:post_id]
    render :new
  end

  def create
    comment = Comment.new(comment_params)
    comment.author_id = current_user.id

    if comment.save
      redirect_to post_url(comment.post)
    else
      comment.errors.full_messages
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :parent_comment_id, :post_id)
  end
end
