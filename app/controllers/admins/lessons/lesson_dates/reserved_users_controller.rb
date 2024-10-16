class Admins::Lessons::LessonDates::ReservedUsersController < Admins::ApplicationController
  before_action :set_lesson_date

  def index
    @lesson_users = @lesson_date.reserved_users.joins(:reservation)
    @reserved_users = @lesson_date.reserved_users.order('reservations.created_at ASC').page(params[:page]).per(100)
  end

  private

  def set_lesson_date
    @lesson_date = LessonDate.find(params[:lesson_date_id])
  end
end
