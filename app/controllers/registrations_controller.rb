class RegistrationsController < Devise::RegistrationsController

  def create
    # add custom client registration logic
  end

  protected

  # def after_sign_up_path_for(resource)
  # TODO: Redirect to cart path
  #   commitment_path
  # end

  # def after_update_path_for(resource)
  # Redirect to user profile path
  #   profile_user_path(resource)
  # end

end
