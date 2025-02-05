class SendMessageJob < ApplicationJob
  def perform(message)
    Rails.logger.info("Sending SMS: #{message.inspect}")

    Rails.application.credentials.twilio => {
      account_sid:, auth_token:, twilio_phone:
    }

    client = Twilio::REST::Client.new account_sid, auth_token
    resp = client.messages.create(
      from: twilio_phone,
      to: message.phone,
      body: message.message
    )
    Rails.logger.info("Twilio response: #{resp.inspect}")
  end
end
