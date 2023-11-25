class ArticleTagsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_article_tag, only: %i[ show edit update destroy ]

  # GET /article_tags or /article_tags.json
  def index
    @article_tags = ArticleTag.all
  end

  # GET /article_tags/1 or /article_tags/1.json
  def show
  end

  # GET /article_tags/new
  def new
    @article_tag = Article_tag.new
  end

  # GET /article_tags/1/edit
  def edit
  end

  # POST /article_tags or /article_tags.json
  def create
  @article = Article.find(params[:article_id])
  if current_user==@article.user||current_user.admin==1
    @article_tag = ArticleTag.new(article_tag_params)
    @article_tag.article = @article

    respond_to do |format|
      if @article_tag.save
        format.html { redirect_to course_article_url(@article.course ,@article),
        notice: "标签添加成功" }
        format.json { render :show, status: :created, location: @article_tag }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @article_tag.errors, status: :unprocessable_entity }
      end
    end
  else
    redirect_to course_article_url(@article.course ,@article),
    notice: "无权限"
  end
  end

  # PATCH/PUT /article_tags/1 or /article_tags/1.json
  def update
    respond_to do |format|
      if @article_tag.update(article_tag_params)
        format.html { redirect_to course_articles_url(@article.course ,@article), notice: "Course article_tag was successfully updated." }
        format.json { render :show, status: :ok, location: @article_tag }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @article_tag.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /article_tags/1 or /article_tags/1.json
  def destroy
    @article_tag.destroy!

    respond_to do |format|
      format.html { redirect_to article_tags_url, notice: "Course article_tag was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_article_tag
      @article_tag = Coursearticle_tag.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def article_tag_params
      params.require(:article_tag).permit(:id, :content)
    end
end
