class Lessons::LessonDatesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_lesson

  def index
    @lesson_dates = @lesson.lesson_dates.where(start_at: Time.zone.now..).order(:start_at).page(params[:page]).per(10)
  end

  private

  def set_lesson
    @lesson = Lesson.published.find(params[:lesson_id])
  end
end
