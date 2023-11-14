require "test_helper"

class CourseCommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_comment = course_comments(:one)
  end

  test "should get index" do
    get course_comments_url
    assert_response :success
  end

  test "should get new" do
    get new_course_comment_url
    assert_response :success
  end

  test "should create course_comment" do
    assert_difference("CourseComment.count") do
      post course_comments_url, params: { course_comment: { content: @course_comment.content, course_id: @course_comment.course_id } }
    end

    assert_redirected_to course_comment_url(CourseComment.last)
  end

  test "should show course_comment" do
    get course_comment_url(@course_comment)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_comment_url(@course_comment)
    assert_response :success
  end

  test "should update course_comment" do
    patch course_comment_url(@course_comment), params: { course_comment: { content: @course_comment.content, course_id: @course_comment.course_id } }
    assert_redirected_to course_comment_url(@course_comment)
  end

  test "should destroy course_comment" do
    assert_difference("CourseComment.count", -1) do
      delete course_comment_url(@course_comment)
    end

    assert_redirected_to course_comments_url
  end
end
