require 'httparty'
require 'json'

class Message < ApplicationRecord
  before_validation :strip_phone_number
  before_save :to_lacrm
  
  validates :name, presence: true
  validates :body, presence: { message: "Tell us how we can help" }
  validates :phone, presence: true, format: { with: /\A\d{10}\z/, message: "must be a valid 10-digit phone number" }
  validates :email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "must be a valid email address" }

  def strip_phone_number
    self.phone = phone.to_s.gsub(/[-() ]/, "")
  end

  def to_lacrm
    api_key = ENV['LACRM_API']

    # Set the endpoint and headers
    endpoint = "https://api.lessannoyingcrm.com/v2/"  
     
    #name = self.first_name + ' ' + self.last_name <- use for forms with first name and last name fields.

    headers = {
        "Authorization" => ENV['LACRM_API'],
        "Content-Type" => "application/json"
    }

    payload = {
        "Function" => "CreateContact",
        "Parameters" => {
            "IsCompany" => false,
            "AssignedTo" => "850228" ,  #This needs to be the USERID...
            "Name" => "#{self.name}",
            "Email" => "#{self.email}",
            "Phone" => "#{self.phone}",
            "Background Info" => "#{self.body}",

        }
    }

    # Make the POST request to create the contact
    # response = HTTParty.post(endpoint, headers: headers, body: contact_data.to_json)
    response = HTTParty.post(endpoint, headers: headers, body: payload.to_json)
    if response.code == 200
      # API Contact created successfully
      self.lacrm_contact_id = JSON.parse(response.body)['ContactId']
    else
      self.lacrm_contact_id = 0
    end
    self.lacrm_response_code = response.code
    self.lacrm_response_body = response.body
  end
end
