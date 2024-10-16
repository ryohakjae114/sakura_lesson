class Lessons::SurveyQuestions::SurveyAnswersController < ApplicationController
  before_action :set_survey_question

  def new
    @survey_answer = @survey_question.survey_answers.build
  end

  def create
    @survey_answer = @survey_question.survey_answers.build(survey_answer_params)
    if @survey_answer.save!
      redirect_to lesson_survey_questions_path(@survey_question.lesson), notice: t('.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def set_survey_question
    @survey_question = SurveyQuestion.find(params[:survey_question_id])
  end

  def survey_answer_params
    params.require(:survey_answer).permit(:content).merge(user_id: current_user.id)
  end
end
