class LessonsController < ApplicationController
  def index
    @lessons = Lesson.where(public: true).order(:created_at).page(params[:page]).per(10)
  end
end
