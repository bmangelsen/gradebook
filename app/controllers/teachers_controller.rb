class TeachersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all
  end

  def new
    @teacher = Teacher.new
  end

  def create
    @teacher = Teacher.new(teacher_params)
    if @teacher.save
      redirect_to teachers_path
    else
      render :new
    end
  end

  private

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
