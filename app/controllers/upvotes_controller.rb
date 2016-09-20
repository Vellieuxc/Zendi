class UpvotesController < ApplicationController
  def create
    @comment=Comment.find(params[:comment_id])
    @comment.upvotes.create! user: current_user

    respond_to do |format|
      format.html { redirect_to comment_path }
      format.js
    end

  end
  def destroy
    upvote=Upvote.find(params[:id])
    @comment=upvote.comment
    upvote.destroy
    respond_to do |format|
      format.html { redirect_to comment_path }
      format.js
    end
  end
end
