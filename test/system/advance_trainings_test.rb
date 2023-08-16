require "application_system_test_case"

class AdvanceTrainingsTest < ApplicationSystemTestCase
  setup do
    @advance_training = advance_trainings(:one)
  end

  test "visiting the index" do
    visit advance_trainings_url
    assert_selector "h1", text: "Advance trainings"
  end

  test "should create advance training" do
    visit advance_trainings_url
    click_on "New advance training"

    fill_in "Certificate sought", with: @advance_training.certificate_sought
    fill_in "Comments", with: @advance_training.comments
    fill_in "Email", with: @advance_training.email
    fill_in "First name", with: @advance_training.first_name
    fill_in "Last name", with: @advance_training.last_name
    fill_in "Phone", with: @advance_training.phone
    click_on "Create Advance training"

    assert_text "Advance training was successfully created"
    click_on "Back"
  end

  test "should update Advance training" do
    visit advance_training_url(@advance_training)
    click_on "Edit this advance training", match: :first

    fill_in "Certificate sought", with: @advance_training.certificate_sought
    fill_in "Comments", with: @advance_training.comments
    fill_in "Email", with: @advance_training.email
    fill_in "First name", with: @advance_training.first_name
    fill_in "Last name", with: @advance_training.last_name
    fill_in "Phone", with: @advance_training.phone
    click_on "Update Advance training"

    assert_text "Advance training was successfully updated"
    click_on "Back"
  end

  test "should destroy Advance training" do
    visit advance_training_url(@advance_training)
    click_on "Destroy this advance training", match: :first

    assert_text "Advance training was successfully destroyed"
  end
end
