class TopController < ApplicationController
  def index
    # @lessons = Lesson.order('id ASC').limit(20)
    # @lessons = Lesson.where('title LIKE(?)',"%#{params[:keyword]}%").limit(20)
  end

  def search
    # binding.pry
    if params[:keyword].present?
      @lessons = Lesson.where('title LIKE(?)',"%#{params[:keyword]}%").page(params[:page]).per(10)
    elsif params[:teacher].present?
      @lessons = Lesson.where('teacher LIKE(?)',"%#{params[:teacher]}%").page(params[:page]).per(10)
    # elsif params[:context].present?
    #   @lessons = Lesson.where('teacher LIKE(?)',"%#{params[:teacher]}%").limit(20)
    end

    # @users = Lesson.page(params[:page]).per(10).order(:id)
  end

  def entry
    @lesson=Lesson.find(params[:id])
    @review =Review.new
    if params[:alert] then
      @validate = true
    else
      @validate = false
    end
    # binding.pry
  end

  def create
  end


  def  post
    # binding.pry
    Review.create(review: params[:review],rate: params[:rate], nickname: params[:nickname],lesson_id: params[:lesson_id])
    redirect_to action: :entry
  end
end
