class CommentsController < ApplicationController
  skip_before_action :isAdminUser
  def index
  end

  def destroy
    @comment = Comment.delete(params[:id])
    render json: {
      message: "delete cmt #{params[:id]} success"
    }
  end
  def create
    @comment = Comment.new(data)
    if @comment.save
      render json: {
        message: "add comment success"
      }
    end
  end

  private
  def data
    params.permit(:content, :post_id, :user_id)
  end
end
