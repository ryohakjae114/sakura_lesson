class LessonsController < ApplicationController
  before_action :set_lesson, only: %i[show]

  def index
    @lessons = Lesson.where(public: true).order(:created_at).page(params[:page]).per(10)
  end

  def show
  end

  private

  def set_lesson
    @lesson = Lesson.where(public: true).find(params[:id])
  end
end
