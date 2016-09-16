class CommentsController < ApplicationController
  def index
    @comments=Comment.first
  end
end
