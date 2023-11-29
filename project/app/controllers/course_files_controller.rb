class CourseFilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course_file, only: %i[ show edit update destroy ]
  before_action :permisson!, only: %i[edit update destroy]

  # GET /course_files or /course_files.json
  def index
    @course_files = CourseFile.all
  end

  # GET /course_files/1 or /course_files/1.json
  def show
  end

  # GET /course_files/new
  def new
    @course_file = CourseFile.new
  end

  # GET /course_files/1/edit
  def edit
  end

  # POST /course_files or /course_files.json
  def create
    @course = Course.find(params[:course_id])
    @course_file = CourseFile.new(course_file_params)
    @course_file.course = @course
    if @course_file.file.nil?
      redirect_to list_course_files_course_url(@course),alert: "资料不能为空"
    else
    respond_to do |format|
      if @course_file.save
        format.html { redirect_to list_course_files_course_url(@course),
        notice: "资料上传成功" }
        format.json { render :show, status: :created, location: @course_file }
      else
        format.html { redirect_to list_course_files_course_url(@course), status: :unprocessable_entity }
        format.json { render json: @course_file.errors, status: :unprocessable_entity }
      end
    end
  end
  end

  # PATCH/PUT /course_files/1 or /course_files/1.json
  def update
    respond_to do |format|
      if @course_file.update(course_file_params)
        format.html { redirect_to course_file_url(@course_file), notice: "资料更新成功" }
        format.json { render :show, status: :ok, location: @course_file }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_file.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_files/1 or /course_files/1.json
  def destroy
    @course_file.destroy!

    respond_to do |format|
      format.html { redirect_to list_course_files_course_url(@course_file.course),
      notice: "资料删除成功" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_file
      @course_file = CourseFile.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_file_params
      params.require(:course_file).permit(:course_id, :title, :description, :file)
    end

    def permisson!
      if !(current_user.admin==1)
        redirect_to user_url(current_user), notice: '非法行为：无权限！'
      end
    end
end
