class ParentsController < ApplicationController
  load_and_authorize_resource


  def parent_params
    params.require(:parent).permit(:name, :student_id)
  end
end
