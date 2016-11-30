class UsersController < ApplicationController

  def edit
    @user = User.find_by(id: params[:id])
  end

  def update
    @user = User.find_by(id: params[:id])
    if params[user_type][:password] == ""
      @empty_field = "You left a field blank!"
      render :edit
    else
      @user.update(password: params[user_type][:password])
      if @user.save
        redirect_to root_path
      else
        render :edit
      end
    end
  end

  def user_type
    if @user.type == "Teacher"
      :teacher
    elsif @user.type == "Student"
      :student
    else
      :parent
    end
  end
end
