class MyPagesController < ApplicationController
  def show
    @reservations = current_user.reservations.includes(lesson_date: :lesson).order('lesson_dates.start_at asc').page(params[:page]).per(10)
  end
end
