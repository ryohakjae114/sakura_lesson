class Admins::Lessons::LessonDatesController < Admins::ApplicationController
  def index
    @lesson_dates = Lesson.find(params[:lesson_id]).lesson_dates.order(created_at: :desc).page(params[:page]).per(100)
  end

  def new
  end
end
