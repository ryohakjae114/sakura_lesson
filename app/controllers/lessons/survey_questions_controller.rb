class Lessons::SurveyQuestionsController < ApplicationController
  before_action :set_lesson

  def index
    @survey_questions = @lesson.survey_questions.order(created_at: :asc)
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
