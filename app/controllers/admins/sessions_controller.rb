class Admins::SessionsController < Devise::SessionsController
  layout 'admin'

  def after_sign_in_path_for(resource)
    admins_root_path
  end
end
