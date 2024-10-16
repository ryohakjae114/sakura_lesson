class Lessons::SurveyQuestions::SurveyAnswersController < ApplicationController
  before_action :set_survey_question, only: %i[new create]
  before_action :set_survey_answer, only: %i[edit update]

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

  def update
    if @survey_answer.update(survey_answer_params)
      redirect_to lesson_survey_questions_path(@survey_answer.survey_question.lesson), notice: t('.updated'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def set_survey_question
    @survey_question = SurveyQuestion.find(params[:survey_question_id])
  end

  def set_survey_answer
    @survey_answer = SurveyAnswer.find(params[:id])
  end

  def survey_answer_params
    params.require(:survey_answer).permit(:content).merge(user_id: current_user.id)
  end
end
