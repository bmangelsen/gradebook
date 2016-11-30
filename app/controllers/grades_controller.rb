class GradesController < ApplicationController
  load_and_authorize_resource

  def index
    @grades = Grade.all
  end

  def new
    @grade = Grade.new
  end

  def create
    @grade = Grade.new(grade_params)
    if @grade.save
      redirect_to grades_path
    else
      render :new
    end
  end

  def grade_params
    params.require(:grade).permit(:assignment_name, :date, :grade, :student_id)
  end
end
