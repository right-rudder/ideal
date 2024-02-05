class DiscoverFlightsMailer < ApplicationMailer

  default from: 'no-reply@idealaviationstlouis.com'

  def discover_flights_email(discover_flight)
    @discover_flight = discover_flight

    if Rails.env.production?
      mail(to: @discover_flight.email, bcc: ["info@idealaviationstlouis.com", "info@idealaviationstl.com"], subject: "✈️ Discovery Flight at Ideal Aviation")
    else
      mail(to: @discover_flight.email, bcc: ["info@idealaviationstlouis.com"], subject: "✈️ Discovery Flight at Ideal Aviation")
    end

  end


end
