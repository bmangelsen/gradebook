class ParentsController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.accessible_by(current_ability)
  end

  def new
    @parent = Parent.new
  end

  def create
    @parent = Parent.new(parent_params)
    if @parent.save
      redirect_to parents_path
    else
      render :new
    end
  end

  private

  def parent_params
    params.require(:parent).permit(:name, :student_id)
  end
end
