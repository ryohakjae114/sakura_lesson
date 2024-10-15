class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[destroy]

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(100)
  end

  def destroy
    @user.destroy!
    redirect_to admins_root_path, notice: t('controller.destroyed'), status: :see_other
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:email, :name)
  end
end
