class Users::RegistrationsController < Devise::RegistrationsController

  def create
    @user = User.new(user_params)
    if @user.save
      respond_to do |format|
        format.json
      end
      sign_in @user
    else
      respond_to do |format|
        format.json
      end
    end
  end

private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
