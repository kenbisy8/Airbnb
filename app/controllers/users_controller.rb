class UsersController < ApplicationController
  before_action :get_diaries, :get_diaries_without_private, only: :show
  before_action :get_user

  def show
    @diaries = @diaries.order("created_at DESC")
    @public_diaries = @public_diaries.order("created_at DESC")
  end

  def edit
    redirect_to root_path unless @user.id == current_user.id
  end

  def update
    if @user.update_attributes(user_params)
      render 'edit'
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

  def get_user
    @user = User.find(params[:id])
  end

  def get_diaries
    @diaries = Diary.where(article_user_id: params[:id])
  end

  def get_diaries_without_private
    @public_diaries = Diary.where(article_user_id: params[:id], publicity: false)
  end
end
