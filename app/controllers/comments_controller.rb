class CommentsController < ApplicationController
  def index
  end

  def destroy
    @comment = Comment.delete(params[:id])
    redirect_back(fallback_location: '')
  end
  def create
    @comment = Comment.new(data)
    if @comment.save
      redirect_back(fallback_location: '')
    end
  end

  private
  def data
    params.permit(:content, :post_id)
  end
end
