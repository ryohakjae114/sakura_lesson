class Admins::UsersController < Admins::ApplicationController
  before_action :set_user, only: %i[edit update destroy]

  def index
    @users = User.order(created_at: :desc).page(params[:page]).per(100)
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to edit_admins_user_path(@user), notice: t('controller.updated'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
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
    params.require(:user).permit(:name)
  end
end
