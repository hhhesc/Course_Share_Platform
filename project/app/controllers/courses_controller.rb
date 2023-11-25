class CoursesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course, only: %i[ show edit update destroy list_comments list_articles add_score
  list_course_files list_questions search_by_tag]

  # GET /courses or /courses.json
  def index
    @courses = Course.all
  end

  # GET /courses/1 or /courses/1.json
  def show
  end

  # GET /courses/new
  def new
    @course = Course.new
  end

  # GET /courses/1/edit
  def edit
  end

  # POST /courses or /courses.json
  def create
    @course = Course.new(course_params)

    respond_to do |format|
      if @course.save
        format.html { redirect_to course_url(@course), notice: "Course was successfully created." }
        format.json { render :show, status: :created, location: @course }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /courses/1 or /courses/1.json
  def update
    respond_to do |format|
      if @course.update(course_params)
        format.html { redirect_to course_url(@course), notice: "Course was successfully updated." }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /courses/1 or /courses/1.json
  def destroy
    @course.destroy!

    respond_to do |format|
      format.html { redirect_to courses_url, notice: "Course was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def list_comments
  end

  def list_articles
  end

  def list_course_files
  end

  def list_questions
  end

  def add_score
    @course_score = CourseScore.new(@course,current_user,params[:value])
    @course.course_scores << @course_score
    current_user.scored_courses << @course
    redirect_to @course, notice: "评分完成"
  end

  def search_by_tag
    query = params[:query]
    tags = ArticleTag.where("content LIKE ?", "%#{query}%")
    articles = Article.where(id: tags.map(&:article_id))
    @articles = articles
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_params
      params.require(:course).permit(:course_name, :course_description)
    end
end