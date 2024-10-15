class Admins::UsersController < Admins::ApplicationController
  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(100)
  end
end
