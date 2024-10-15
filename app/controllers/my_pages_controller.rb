class MyPagesController < ApplicationController
  def show
    @reserved_lesson_dates = current_user.reserved_lesson_dates.order(date: :asc, start_at: :desc).page(params[:page]).per(10).includes(:lesson)
  end
end
