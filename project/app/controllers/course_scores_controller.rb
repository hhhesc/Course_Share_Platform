class CourseScoresController < ApplicationController
    before_action :authenticate_user!
    before_action :permisson!, only: %i[edit update destroy]
    
    def new
        @course_score = CourseScore.new
    end
    def create
        @course = Course.find(params[:course_id])
        @course_score = CourseScore.new(course_score_params)
        @course_score.course = @course
        @course_score.user = current_user

        respond_to do |format|
            if @course_score.course_score<0 or @course_score.course_score>10
                format.html {redirect_to @course, notice: "分数需在0-10之间"}
                format.json { render :show, status: :created, location: @course_score }
            elsif @course_score.save
              format.html { redirect_to @course, notice: "评分成功" }
              format.json { render :show, status: :created, location: @course_score }
            else
              format.html { render :new, status: :unprocessable_entity }
              format.json { render json: @course_score.errors, status: :unprocessable_entity }
            end
        end
    end

    private

    def course_score_params
        params.require(:course_score).permit(:course_id,:user_id,:course_score)
    end

    def permisson!
        if !(current_user==@course_score.user || current_user.admin==1)
          redirect_to user_url(current_user), notice: '非法行为：无权限！'
        end
    end
end
