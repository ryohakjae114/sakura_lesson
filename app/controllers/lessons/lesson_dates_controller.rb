class Lessons::LessonDatesController < ApplicationController
  before_action :set_lesson

  def index
    @lesson_dates = @lesson.lesson_dates.order(:date).page(params[:page]).per(10)
  end

  def set_lesson
    @lesson = Lesson.published.find(params[:lesson_id])
  end
end
