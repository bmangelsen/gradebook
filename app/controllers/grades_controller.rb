class GradesController < ApplicationController
  load_and_authorize_resource

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def edit
    @grade = Grade.find(params[:id])
  end

  def update
    @grade = Grade.find(params[:id])
    @grade.update(grade_params)
    if @grade.save
      redirect_to grades_path
    else
      render :edit
    end
  end

  def destroy
    Grade.find(params[:id]).destroy
    redirect_to grades_path
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_path
    else
      render :new
    end
  end

  private

  def grade_params
    params.require(:grade).permit(:assignment_name, :date, :grade, :student_id)
  end
end
