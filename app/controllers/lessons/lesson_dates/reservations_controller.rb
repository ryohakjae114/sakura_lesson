class Lessons::LessonDates::ReservationsController < ApplicationController
  def create
    reservation = current_user.reservations.create!(lesson_date_id: params[:lesson_date_id])
    ReservationMailer.with(reservation:).reserve_notification.deliver_now
    redirect_back(fallback_location: root_path, notice: t('.reserved'))
  end

  def destroy
    current_user.reservations.find_by!(lesson_date_id: params[:lesson_date_id]).destroy!
    redirect_back(fallback_location: root_path, notice: t('.canceled'), status: :see_other)
  end
end
