require "test_helper"

class QuestionRepliesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @question_reply = question_replies(:one)
  end

  test "should get index" do
    get question_replies_url
    assert_response :success
  end

  test "should get new" do
    get new_question_reply_url
    assert_response :success
  end

  test "should create question_reply" do
    assert_difference("QuestionReply.count") do
      post question_replies_url, params: { question_reply: { content: @question_reply.content, question_id: @question_reply.question_id, user_id: @question_reply.user_id, valid: @question_reply.valid } }
    end

    assert_redirected_to question_reply_url(QuestionReply.last)
  end

  test "should show question_reply" do
    get question_reply_url(@question_reply)
    assert_response :success
  end

  test "should get edit" do
    get edit_question_reply_url(@question_reply)
    assert_response :success
  end

  test "should update question_reply" do
    patch question_reply_url(@question_reply), params: { question_reply: { content: @question_reply.content, question_id: @question_reply.question_id, user_id: @question_reply.user_id, valid: @question_reply.valid } }
    assert_redirected_to question_reply_url(@question_reply)
  end

  test "should destroy question_reply" do
    assert_difference("QuestionReply.count", -1) do
      delete question_reply_url(@question_reply)
    end

    assert_redirected_to question_replies_url
  end
end
