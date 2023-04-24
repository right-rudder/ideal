class MessageConfirmationMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def message_confirmation_email
    @message = params[:message]

    mail(to: @message.email, subject: "✈️ Thank you for contacting Ideal Aviation")

end
