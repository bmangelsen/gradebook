class GradesController < ApplicationController
  load_and_authorize_resource

  def index
    @per_page = 15.0
    @grades = Grade.limit(@per_page).offset(@per_page * current_page).accessible_by(current_ability)
  end

  def total_pages
    (Grade.count / @per_page).ceil
  end

  def current_page
    @page = params[:page].to_i
  end

  helper_method :total_pages
  helper_method :current_page

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
