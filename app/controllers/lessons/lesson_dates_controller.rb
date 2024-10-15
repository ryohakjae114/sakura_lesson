class Lessons::LessonDatesController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_lesson

  def index
    @lesson_dates = @lesson.lesson_dates.order(:start_at).page(params[:page]).per(10)
  end

  def set_lesson
    @lesson = Lesson.published.find(params[:lesson_id])
  end
end
