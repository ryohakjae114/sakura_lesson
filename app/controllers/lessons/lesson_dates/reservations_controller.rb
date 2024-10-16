class Lessons::LessonDates::ReservationsController < ApplicationController
  def create
    reservation = current_user.reservations.create!(lesson_date_id: params[:lesson_date_id])
    ReservationMailer.with(reservation:).reserve_notification.deliver_now
    redirect_to lesson_survey_questions_path(reservation.lesson_date.lesson_id), notice: t('.reserved')
  end

  def destroy
    current_user.reservations.find(params[:id]).destroy!
    redirect_back(fallback_location: root_path, notice: t('.canceled'), status: :see_other)
  end
end
