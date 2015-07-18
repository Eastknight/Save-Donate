class CompaniesController < Devise::RegistrationsController
  skip_before_action :authenticate_scope!

  def destroy
    @company = Company.find_by_email(request.headers['X-Company-Email'])
    if @company && @company.authentication_token == request.headers['X-Company-Token']
      @company.destroy
      render json: {success: true}
    else
      render json: {error: "You need to sign in or sign up before continuing."}
    end
  end

  private
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) do |u| 
      u.permit(:name, :email, :password, :password_confirmation, :phone)
    end
  end
end