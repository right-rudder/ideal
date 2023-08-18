class AdvanceTrainingsMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def book_downloads(advance_training)
    @advance_training = advance_training

    # mail(to: @advance_training.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Thank you for filling up the form for your #{certificate_sought}.")
    mail(to: @advance_training.email, bcc: ["info@idealaviationstlouis.com"], subject: "✈️ Thank you for filling up the form for your #{@advance_training.certificate_sought}.")
  end

end
