class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_question, only: %i[ show edit update destroy change_solved]
  before_action :permisson!, only: %i[edit update destroy change_solved]

  # GET /questions or /questions.json
  def index
    @questions = Question.all
  end

  # GET /questions/1 or /questions/1.json
  def show
  end

  # GET /questions/new
  def new
    @question = Question.new
  end

  # GET /questions/1/edit
  def edit
  end

  # POST /questions or /questions.json
  def create
    @course = Course.find(params[:course_id])
    @question = Question.new(question_params)
    @question.course = @course
    @question.user = current_user

    respond_to do |format|
      if @question.save
        format.html { redirect_to list_questions_course_url(@course),
        notice: "问题创建成功" }
        format.json { render :show, status: :created, location: @question }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /questions/1 or /questions/1.json
  def update
    respond_to do |format|
      if @question.update(question_params)
        format.html { redirect_to question_url(@question), notice: "问题更新成功" }
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /questions/1 or /questions/1.json
  def destroy
    @question.destroy!

    respond_to do |format|
      format.html { redirect_to questions_url, notice: "问题删除成功" }
      format.json { head :no_content }
    end
  end

  def change_solved
    if @question.solved == 0
      @question.solved = 1
    else
      @question.solved = 0
    end

    respond_to do |format|
      if @question.save
        format.html { redirect_to question_url(@question)}
        format.json { render :show, status: :ok, location: @question }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question
      @question = Question.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_params
      params.require(:question).permit(:course_id, :user_id, :title, :content, :solved)
    end

    def permisson!
      if !(current_user==@question.user || current_user.admin==1)
        redirect_to user_url(current_user), notice: '非法行为：无权限！'
      end
    end
end
