class Admins::LessonsController < Admins::ApplicationController
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

  private

  def lesson_params
    params.require(:lesson).permit(:title, :summary, :instructor, :public)
  end
end
