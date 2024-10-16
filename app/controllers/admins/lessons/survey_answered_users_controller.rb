class Admins::Lessons::SurveyAnsweredUsersController < Admins::ApplicationController
  before_action :set_lesson

  def index
    survey_answers = SurveyAnswer.where(survey_question_id: @lesson.survey_question_ids)
    @survey_answered_users = User.where(id: survey_answers.pluck(:user_id))
                                 .joins(:survey_answers).order('survey_answers.created_at desc')
                                 .page(params[:page]).per(100)
  end

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end
end
