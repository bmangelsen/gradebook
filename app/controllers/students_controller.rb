class StudentsController < ApplicationController
  load_and_authorize_resource

  def student_params
    params.require(:student).permit(:name, :teacher_id)
  end
end
