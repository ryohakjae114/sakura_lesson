class LessonsController < ApplicationController
  skip_before_action :authenticate_user!
  before_action :set_lesson, only: %i[show]

  def index
    @lessons = Lesson.published.order(created_at: :desc).page(params[:page]).per(10)
  end

  def show
  end

  private

  def set_lesson
    @lesson = Lesson.published.find(params[:id])
  end
end
