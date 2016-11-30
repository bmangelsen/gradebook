class TeachersController < ApplicationController
  load_and_authorize_resource

  def teacher_params
    params.require(:teacher).permit(:name)
  end
end
