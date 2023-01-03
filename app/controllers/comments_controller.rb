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
      redirect_back(fallback_location: '')
    end
  end

  private
  def data
    params.permit(:content, :post_id, :user_id)
  end
end
