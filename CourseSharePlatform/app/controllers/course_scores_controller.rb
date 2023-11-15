class CourseScoresController < ApplicationController
    def new
        @course_score = CourseScore.new
    end
    def create
        @course = Course.find(params[:course_id])
        @course_score = CourseScore.new(course_score_params)
        @course_score.course = @course
        @course_score.user = current_user

        respond_to do |format|
            if @course_score.save
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
end
