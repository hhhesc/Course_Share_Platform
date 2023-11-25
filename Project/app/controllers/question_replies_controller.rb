class QuestionRepliesController < ApplicationController
  before_action :set_question_reply, only: %i[ show edit update destroy change_ac ]

  # GET /question_replies or /question_replies.json
  def index
    @question_replies = QuestionReply.all
  end

  # GET /question_replies/1 or /question_replies/1.json
  def show
  end

  # GET /question_replies/new
  def new
    @question_reply = QuestionReply.new
  end

  # GET /question_replies/1/edit
  def edit
  end

  # POST /question_replies or /question_replies.json
  def create
    @question = Question.find(params[:question_id])
    @question_reply = QuestionReply.new(question_reply_params)
    @question_reply.question = @question
    @question_reply.user = current_user
    @question_reply.accepted = 0

    respond_to do |format|
      if @question_reply.save
        format.html { redirect_to question_url(@question_reply.question), notice: "Question reply was successfully created." }
        format.json { render :show, status: :created, location: @question_reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /question_replies/1 or /question_replies/1.json
  def update
    respond_to do |format|
      if @question_reply.update(question_reply_params)
        format.html { redirect_to question_url(@question_reply.question), notice: "Question reply was successfully updated." }
        format.json { render :show, status: :ok, location: @question_reply }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @question_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /question_replies/1 or /question_replies/1.json
  def destroy
    @question_reply.destroy!

    respond_to do |format|
      format.html { redirect_to question_url(@question_reply.question), notice: "Question reply was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def change_ac
    if @question_reply.accepted == 0
      @question_reply.accepted = 1
    else
      @question_reply.accepted = 0
    end
    respond_to do |format|
      if @question_reply.save
        format.html { redirect_to question_url(@question_reply.question) }
        format.json { render :show, status: :created, location: @question_reply }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @question_reply.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_question_reply
      @question_reply = QuestionReply.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def question_reply_params
      params.require(:question_reply).permit(:question_id, :user_id, :content, :accepted)
    end
end
