class AdvanceTrainingsMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def advance_trainings(advance_training)
    @advance_training = advance_training

    # Comment out to not include info@idealaviationstl.com for testing.
    # mail(to: @advance_training.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Requesting Information About Ideal Aviation's #{@advance_training.certificate_sought}")
    mail(to: @advance_training.email, bcc: ["info@idealaviationstlouis.com"], subject: "✈️ Requesting Information About Ideal Aviation's #{@advance_training.certificate_sought}")
  end

end
