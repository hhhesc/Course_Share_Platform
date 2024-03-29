class CourseCommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_course_comment, only: %i[ show edit update destroy beLiked beUnliked]
  before_action :permisson!, only: %i[edit update destroy]

  # GET /course_comments or /course_comments.json
  def index
    @course_comments = CourseComment.all
  end

  # GET /course_comments/1 or /course_comments/1.json
  def show
  end

  # GET /course_comments/new
  def new
    @course_comment = CourseComment.new
  end

  # GET /course_comments/1/edit
  def edit
  end

  # POST /course_comments or /course_comments.json
  def create
    @course = Course.find(params[:course_id])
    @course_comment = CourseComment.new(course_comment_params)
    @course_comment.course = @course
    @course_comment.user = current_user

    respond_to do |format|
      if @course_comment.save
        format.html { redirect_to list_comments_course_path(@course), notice: "评论发表成功" }
        format.json { render :show, status: :created, location: @course_comment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @course_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /course_comments/1 or /course_comments/1.json
  def update
    respond_to do |format|
      if @course_comment.update(course_comment_params)
        format.html { redirect_to list_comments_course_path(@course_comment.course),
        notice: "评论更新成功" }
        format.json { render :show, status: :ok, location: @course_comment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @course_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /course_comments/1 or /course_comments/1.json
  def destroy
    @course_comment.destroy!

    respond_to do |format|
      format.html { redirect_to list_comments_course_path(@course_comment.course),
      notice: "评论删除成功" }
      format.json { head :no_content }
    end
  end

  def beLiked
    if not @course_comment.like_users.include? current_user
      @course_comment.like_users << current_user
      redirect_to list_comments_course_path(@course_comment.course)
    end
  end

  def beUnliked
    if @course_comment.like_users.include? current_user
      @course_comment.like_users.delete(current_user)
      redirect_to list_comments_course_path(@course_comment.course)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course_comment
      @course_comment = CourseComment.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def course_comment_params
      params.require(:course_comment).permit(:course_id, :content)
    end

    def permisson!
      if !(current_user==@course_comment.user || current_user.admin==1)
        redirect_to user_url(current_user), notice: '非法行为：无权限！'
      end
    end
end
