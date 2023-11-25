require "application_system_test_case"

class CourseCommentsTest < ApplicationSystemTestCase
  setup do
    @course_comment = course_comments(:one)
  end

  test "visiting the index" do
    visit course_comments_url
    assert_selector "h1", text: "Course comments"
  end

  test "should create course comment" do
    visit course_comments_url
    click_on "New course comment"

    fill_in "Content", with: @course_comment.content
    fill_in "Course", with: @course_comment.course_id
    click_on "Create Course comment"

    assert_text "Course comment was successfully created"
    click_on "Back"
  end

  test "should update Course comment" do
    visit course_comment_url(@course_comment)
    click_on "Edit this course comment", match: :first

    fill_in "Content", with: @course_comment.content
    fill_in "Course", with: @course_comment.course_id
    click_on "Update Course comment"

    assert_text "Course comment was successfully updated"
    click_on "Back"
  end

  test "should destroy Course comment" do
    visit course_comment_url(@course_comment)
    click_on "Destroy this course comment", match: :first

    assert_text "Course comment was successfully destroyed"
  end
end
