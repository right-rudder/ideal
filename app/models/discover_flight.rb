class DiscoverFlight < ApplicationRecord
  before_validation :strip_phone_number
  after_save :to_lacrm
  after_save :to_ghl
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def strip_phone_number
    self.phone = phone.to_s.gsub(/[-() ]/, "")
  end

  def to_lacrm
    api_key = ENV['LACRM_API']
    # Set the endpoint and headers
    endpoint = "https://api.lessannoyingcrm.com/v2/"
    headers = {
      "Authorization" => api_key,
      "Content-Type" => "application/json"
    }
    # Get the user ID
    user_payload = {
      "Function" => "GetUser",
      "Parameters" => {}
    }
    user_response = HTTParty.get(endpoint, headers: headers, body: user_payload.to_json)
    if user_response.code == 200
      user_id = JSON.parse(user_response.body)['UserId']
    else
      # Handle the error
      user_id = nil
    end

    # Create the contact
    contact_payload = {
      "Function" => "CreateContact",
      "Parameters" => {
        "IsCompany" => false,
        "AssignedTo" => user_id,  #need to just get the USER ID so I can avoid doin the get call each time..
        "Name" => "#{self.first_name} #{self.last_name}",
        "Email" => "#{self.email}",
        "Phone" => "#{self.phone}",
        "Background Info" => "Originated from discovery flight form on website",
      }
    }


    

    response = HTTParty.post(endpoint, headers: headers, body: contact_payload.to_json)
    contact_id = JSON.parse(response.body)['ContactId']
    

    # Add a note
    note_payload = {
      "Function" => "CreateNote",
      "Parameters" => {
        "ContactId" => contact_id,
        "Note" => "
          Select aircraft category:  #{self.aircraft}
    
          Is there anything else you'd like us to know: #{self.comments}
        
          Selected Date: #{self.preferred_date}
          Selected Time: #{self.preferred_availability}
          Alternate Date: #{self.alternate_date}
          Alternate Time: #{self.alternate_availability}
        ",
      }
    }
    HTTParty.post(endpoint, headers: headers, body: note_payload.to_json)

  end  

  def to_ghl
    ghl_url = ENV['DISCOVERY_FLIGHT_URL']
    ghl_payload = {
      "first name" => "#{self.first_name}",
      "last name" => "#{self.last_name}",
      "email" => "#{self.email}",
      "phone" => "#{self.phone}",
      "notes" => "
      
      Interested program: #{self.aircraft}
      Comments: #{self.comments}
      Preferred date: #{self.preferred_date} #{self.preferred_availability}
      Alternate date: #{self.alternate_date} #{self.alternate_availability}
      ",
    }     
    HTTParty.post(ghl_url, body: ghl_payload.to_json, headers: { "Content-Type" => "application/json" })
  end
end
