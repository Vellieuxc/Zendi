class DoctorsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]
  before_action :find_comment, only: [:show]
  load_and_authorize_resource
  def index
    @doctor=Doctor.all
  end
  def show
    @comment=Comment.where(doctor: @doctor).first
  end
  private
  def find_comment
    @doctor=Doctor.find(params[:id])
  end
end
