class GradesController < ApplicationController
  load_and_authorize_resource

  def grade_params
    params.require(:grade).permit(:assignment_name, :date, :grade, :student_id)
  end
end
