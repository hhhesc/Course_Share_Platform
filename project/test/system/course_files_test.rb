require "application_system_test_case"

class CourseFilesTest < ApplicationSystemTestCase
  setup do
    @course_file = course_files(:one)
  end

  test "visiting the index" do
    visit course_files_url
    assert_selector "h1", text: "Course files"
  end

  test "should create course file" do
    visit course_files_url
    click_on "New course file"

    fill_in "Course", with: @course_file.course_id
    fill_in "Description", with: @course_file.description
    fill_in "Title", with: @course_file.title
    click_on "Create Course file"

    assert_text "Course file was successfully created"
    click_on "Back"
  end

  test "should update Course file" do
    visit course_file_url(@course_file)
    click_on "Edit this course file", match: :first

    fill_in "Course", with: @course_file.course_id
    fill_in "Description", with: @course_file.description
    fill_in "Title", with: @course_file.title
    click_on "Update Course file"

    assert_text "Course file was successfully updated"
    click_on "Back"
  end

  test "should destroy Course file" do
    visit course_file_url(@course_file)
    click_on "Destroy this course file", match: :first

    assert_text "Course file was successfully destroyed"
  end
end
