class Lessons::LessonDates::ReservationsController < ApplicationController
  def create
    current_user.reservations.create!(lesson_date_id: params[:lesson_date_id])
    redirect_back(fallback_location: root_path, notice: t('.reserved'))
  end
end
