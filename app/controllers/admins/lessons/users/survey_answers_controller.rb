class Admins::Lessons::Users::SurveyAnswersController < ApplicationController
  before_action :set_user, :set_lesson

  def index
    @survey_answers = @user.survey_answers.where(survey_question_id: @lesson.survey_question_ids).order(created_at: :desc)
  end

  private

  def set_user
    @user = User.find(params[:survey_answered_user_id])
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
