require "test_helper"

class AdvanceTrainingsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @advance_training = advance_trainings(:one)
  end

  test "should get index" do
    get advance_trainings_url
    assert_response :success
  end

  test "should get new" do
    get new_advance_training_url
    assert_response :success
  end

  test "should create advance_training" do
    assert_difference("AdvanceTraining.count") do
      post advance_trainings_url, params: { advance_training: { certificate_sought: @advance_training.certificate_sought, comments: @advance_training.comments, email: @advance_training.email, first_name: @advance_training.first_name, last_name: @advance_training.last_name, phone: @advance_training.phone } }
    end

    assert_redirected_to advance_training_url(AdvanceTraining.last)
  end

  test "should show advance_training" do
    get advance_training_url(@advance_training)
    assert_response :success
  end

  test "should get edit" do
    get edit_advance_training_url(@advance_training)
    assert_response :success
  end

  test "should update advance_training" do
    patch advance_training_url(@advance_training), params: { advance_training: { certificate_sought: @advance_training.certificate_sought, comments: @advance_training.comments, email: @advance_training.email, first_name: @advance_training.first_name, last_name: @advance_training.last_name, phone: @advance_training.phone } }
    assert_redirected_to advance_training_url(@advance_training)
  end

  test "should destroy advance_training" do
    assert_difference("AdvanceTraining.count", -1) do
      delete advance_training_url(@advance_training)
    end

    assert_redirected_to advance_trainings_url
  end
end
