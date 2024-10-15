class Admins::LessonsController < Admins::ApplicationController
  before_action :set_lesson, only: %i[edit update destroy]

  def index
    @lessons = Lesson.order(created_at: :desc).page(params[:page]).per(100)
  end

  def new
    @lesson = Lesson.new
  end

  def create
    @lesson = Lesson.new(lesson_params)
    if @lesson.save
      redirect_to admins_root_path, notice: t('controller.created')
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    if @lesson.update(lesson_params)
      redirect_to edit_admins_lesson_path(@lesson), notice: t('controller.updated'), status: :see_other
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @lesson.destroy!
    redirect_to admins_root_path, notice: t('controller.destroyed'), status: :see_other
  end

  private

  def set_lesson
    @lesson = Lesson.find(params[:id])
  end

  def lesson_params
    params.require(:lesson).permit(:title, :summary, :instructor, :published)
  end
end
