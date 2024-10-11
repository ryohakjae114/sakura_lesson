class LessonsController < ApplicationController
  def index
    @lessons = Lesson.where(public: true)
  end
end
