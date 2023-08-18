require "test_helper"

class AdvanceTrainingsMailerTest < ActionMailer::TestCase
  test "advance_trainings" do
    mail = AdvanceTrainingsMailer.advance_trainings
    assert_equal "Advance trainings", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
