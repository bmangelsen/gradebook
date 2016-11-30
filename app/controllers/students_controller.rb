class StudentsController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.accessible_by(current_ability)
  end

  def new
    @student = Student.new
  end

  def create
    @student = Student.new(student_params)
    if @student.save
      redirect_to students_path
    else
      render :new
    end
  end

  private

  def student_params
    params.require(:student).permit(:name, :teacher_id)
  end
end
