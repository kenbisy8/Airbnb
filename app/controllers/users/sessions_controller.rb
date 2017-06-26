class Users::SessionsController < Devise::SessionsController

  def create
    @errors = []
    self.resource = warden.authenticate(auth_options)
    set_flash_message!(:notice, :signed_in)
    if self.resource
      sign_in(resource_name, resource)
    else
      respond_to do |format|
        if params[:password].blank?
          @errors << 'パスワードを確認してください。'
        end
        if params[:email].blank?
          @errors << 'メールアドレスを確認してください。'
        end
        format.json
      end
    end
  end
end
