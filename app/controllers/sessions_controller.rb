class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by(name: params[:name])

    if @user && @user.password_hash == nil
      render 'users/edit'
    elsif @user && @user.authorize!(params[:password])
      session["current_user_id"] = @user.id
      path
    else
      @error = "Wrong password/username combo!"
      render :new
    end
  end

  def path
    @user = User.find_by(name: params[:name])

    if @user.type == "Teacher"
      redirect_to teacher_path(@user.id)
    elsif @user.type == "Student"
      redirect_to student_path(@user.id)
    else
      redirect_to parent_path(@user.id)
    end
  end

  def destroy
    session.delete("current_user_id")
    redirect_to root_path
  end
end
