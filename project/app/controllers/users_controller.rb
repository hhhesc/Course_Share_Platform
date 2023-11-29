class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ show edit update destroy student_certificate follow unfollow
  list_followers list_followings list_favor_articles edit_personal_sign list_questions space]
  before_action :permisson!, only: %i[edit update destroy student_certificate list_followers
  list_followings list_favor_articles edit_personal_sign list_questions space]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to user_url(@user), notice: "用户创建成功" }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user==current_user || current_user.admin==1
      respond_to do |format|
        if @user.update(user_params)
          format.html { redirect_to user_url(@user), notice: "用户更新成功" }
          format.json { render :show, status: :ok, location: @user }
        else
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @user.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to user_url(@user), notice: "无权限"
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user.destroy!

    respond_to do |format|
      format.html { redirect_to users_url, notice: "用户删除成功." }
      format.json { head :no_content }
    end
  end

  def student_certificate
    if @user==current_user || current_user.admin==1
      @user.realname = params[:realname]
      @user.studentcode = params[:studentcode]
    end
  end

  def follow
    current_user.followings << @user
    redirect_to @user, notice: "关注成功"
  end

  def unfollow
    current_user.followings.delete(@user)
    redirect_to @user, notice: "取消关注成功"
  end

  def list_followers
  end

  def list_followings
  end

  def list_favor_articles
  end

  def edit_personal_sign
    if @user==current_user || current_user.admin==1
    @user.personal_sign = params[ :personal_sign]
    end
  end

  def list_questions
  end

  def certainfy
    if params[:code] == 'zzzzz'
      current_user.update_attribute(:admin,1)
      redirect_to user_url(current_user), notice: "管理员权限认证成功"
    else
      redirect_to user_url(current_user), notice: "管理员权限认证失败"
    end

  end

  def space
    followers = @user.followings #命名失误了
    followers_articles = followers.map(&:articles).flatten
    user_articles = @user.articles
    articles = followers_articles + user_articles

    @articles = articles.sort_by(&:created_at).reverse
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_user
    # if params[:id] == 'sign_out'
    #   @user = current_user
    # else
      @user = User.find(params[:id])
    # end
  end

  # Only allow a list of trusted parameters through.
  def user_params
    params.require(:user).permit(:username, :password, :email, :img_path, :realname,
    :studentcode, :personal_sign, :admin)
  end

  # def authenticate
  #   redirect_to login_users_url, alert: 'Must login!' unless current_user
  # end
  def permisson!
    if !(current_user==@user || current_user.admin==1)
      redirect_to user_url(current_user), notice: '非法行为：无权限！'
    end
  end
end
