class ArticlesController < ApplicationController
  before_action :set_article, only: %i[ show edit update destroy beLiked beUnliked beFavored beUnfavored]

  # GET /articles or /articles.json
  def index
    @articles = Article.all
  end

  # GET /articles/1 or /articles/1.json
  def show
  end

  # GET /articles/new
  def new
    @article = Article.new
  end

  # GET /articles/1/edit
  def edit
  end

  # POST /articles or /articles.json
  def create
    @course = Course.find(params[:course_id])
    @user = current_user
    @article = Article.new(article_params)
    @article.course = @course
    @article.user = current_user

    respond_to do |format|
      if @article.save
        format.html { redirect_to course_url(@course), notice: "Article was successfully created." }
        format.json { render :show, status: :created, location: @article }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /articles/1 or /articles/1.json
  def update
    respond_to do |format|
      if @article.update(article_params)
        format.html { redirect_to article_url(@article), notice: "Article was successfully updated." }
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /articles/1 or /articles/1.json
  def destroy
    @article.destroy!

    respond_to do |format|
      format.html { redirect_to articles_url, notice: "Article was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def beLiked
    if not @article.like_users.include? current_user
      @article.like_users << current_user
      redirect_to list_articles_course_path(@article.course)
    end
  end

  def beUnliked
    if @article.like_users.include? current_user
      @article.like_users.delete(current_user)
      redirect_to list_articles_course_path(@article.course)
    end
  end

  def beFavored
    if not @article.favor_users.include? current_user
      @article.favor_users << current_user
      redirect_to list_articles_course_path(@article.course)
    end
  end

  def beUnfavored
    if @article.favor_users.include? current_user
      @article.favor_users.delete(current_user)
      redirect_to list_articles_course_path(@article.course)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article
      @article = Article.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_params
      params.require(:article).permit(:course_id, :user_id, :title, :content)
    end
end
