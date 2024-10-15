class Admins::Lessons::LessonDatesController < Admins::ApplicationController
  before_action :set_lesson, only: %i[index new create]
  before_action :set_lesson_date, only: %i[edit update]

  def index
    @lesson_dates = @lesson.lesson_dates.order(created_at: :desc).page(params[:page]).per(100)
  end

  def new
    @lesson_date = @lesson.lesson_dates.build
  end

  def create
    @lesson_date = @lesson.lesson_dates.build(lesson_date_params)
    if @lesson.save
      redirect_to admins_lesson_lesson_dates_path(@lesson), notice: t('controller.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lesson_date.update(lesson_date_params)
      redirect_to admins_lesson_lesson_dates_path(@lesson_date.lesson), notice: t('controller.updated'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:lesson_id])
  end

  def set_lesson_date
    @lesson_date = LessonDate.find(params[:id])
  end

  def lesson_date_params
    params.require(:lesson_date).permit(:date, :start_time, :end_time, :capacity, :url)
  end
end
