require "test_helper"

class CourseFilesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @course_file = course_files(:one)
  end

  test "should get index" do
    get course_files_url
    assert_response :success
  end

  test "should get new" do
    get new_course_file_url
    assert_response :success
  end

  test "should create course_file" do
    assert_difference("CourseFile.count") do
      post course_files_url, params: { course_file: { course_id: @course_file.course_id, description: @course_file.description, title: @course_file.title } }
    end

    assert_redirected_to course_file_url(CourseFile.last)
  end

  test "should show course_file" do
    get course_file_url(@course_file)
    assert_response :success
  end

  test "should get edit" do
    get edit_course_file_url(@course_file)
    assert_response :success
  end

  test "should update course_file" do
    patch course_file_url(@course_file), params: { course_file: { course_id: @course_file.course_id, description: @course_file.description, title: @course_file.title } }
    assert_redirected_to course_file_url(@course_file)
  end

  test "should destroy course_file" do
    assert_difference("CourseFile.count", -1) do
      delete course_file_url(@course_file)
    end

    assert_redirected_to course_files_url
  end
end
