class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    user = User.find(params[:id])
    if user.update_attributes(user_params)
      render 'edit'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end
end
