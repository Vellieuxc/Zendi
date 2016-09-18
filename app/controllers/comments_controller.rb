class CommentsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_comment, only: [:edit, :update, :destroy, :show]
  load_and_authorize_resource
  def index
    if params[:doctor_id]
      @comments = Comment.where(doctor_id: params[:doctor_id])
    else
      @comments=Comment.all
    end
  end
  def show
  end
  def new
    @comment=Comment.new
  end
  def create
    @comment=Comment.new(comment_params)
    @comment.user=current_user
    @comment.save
    if @comment.save
      redirect_to comments_path
    else
     render :new
    end
  end
  def destroy
    @comment.destroy
    redirect_to comments_path
  end
  def edit
  end
  def update
    if @comment.update(comment_params)
      redirect_to comments_path
    else
      render :edit
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text, :doctor_id)
  end
  def find_comment
    @comment=Comment.find(params[:id])
  end
end
