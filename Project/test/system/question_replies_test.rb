require "application_system_test_case"

class QuestionRepliesTest < ApplicationSystemTestCase
  setup do
    @question_reply = question_replies(:one)
  end

  test "visiting the index" do
    visit question_replies_url
    assert_selector "h1", text: "Question replies"
  end

  test "should create question reply" do
    visit question_replies_url
    click_on "New question reply"

    fill_in "Content", with: @question_reply.content
    fill_in "Question", with: @question_reply.question_id
    fill_in "User", with: @question_reply.user_id
    fill_in "Valid", with: @question_reply.valid
    click_on "Create Question reply"

    assert_text "Question reply was successfully created"
    click_on "Back"
  end

  test "should update Question reply" do
    visit question_reply_url(@question_reply)
    click_on "Edit this question reply", match: :first

    fill_in "Content", with: @question_reply.content
    fill_in "Question", with: @question_reply.question_id
    fill_in "User", with: @question_reply.user_id
    fill_in "Valid", with: @question_reply.valid
    click_on "Update Question reply"

    assert_text "Question reply was successfully updated"
    click_on "Back"
  end

  test "should destroy Question reply" do
    visit question_reply_url(@question_reply)
    click_on "Destroy this question reply", match: :first

    assert_text "Question reply was successfully destroyed"
  end
end
