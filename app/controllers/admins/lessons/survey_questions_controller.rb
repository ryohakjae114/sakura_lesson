class Admins::Lessons::SurveyQuestionsController < ApplicationController
  before_action :set_lesson, only: %i[index new create]
  before_action :set_survey_question, only: :destroy

  def index
    @survey_questions = @lesson.survey_questions.order(created_at: :asc)
  end

  def new
    @survey_question = @lesson.survey_questions.build
  end

  def create
    @survey_question = @lesson.survey_questions.build(survey_question_params)
    if @survey_question.save
      redirect_to admins_lesson_survey_questions_path(@lesson), notice: t('controller.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @survey_question.destroy!
    redirect_to admins_lesson_survey_questions_path(@survey_question.lesson), notice: t('controller.destroyed')
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_survey_question
    @survey_question = SurveyQuestion.find(params[:id])
  end

  def survey_question_params
    params.require(:survey_question).permit(:content)
  end
end
