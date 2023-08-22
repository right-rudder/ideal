class AdvanceTrainingsMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def advance_trainings(advance_training)
    @advance_training = advance_training

    # Comment out to not include info@idealaviationstl.com for testing.
    # mail(to: @advance_training.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Complete your #{@advance_training.certificate_sought} at Ideal Aviation")
    mail(to: @advance_training.email, bcc: ["info@idealaviationstlouis.com"], subject: "✈️ Complete your #{@advance_training.certificate_sought} at Ideal Aviation")
  end

end
