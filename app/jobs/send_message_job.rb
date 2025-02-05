class SendMessageJob < ApplicationJob
  def perform(message)
    Rails.logger.info("Sending SMS: #{message.inspect}")

    Rails.application.credentials.twilio => {
      account_sid:, auth_token:, twilio_phone:
    }

    client = Twilio::REST::Client.new account_sid, auth_token
    twilio_response = client.messages.create(
      from: twilio_phone,
      to: message.phone,
      body: message.message
    )

    message.update! sent_at: DateTime.now,
                    sid: twilio_response.sid,
                    status: twilio_response.status

    Rails.logger.info("Twilio response: #{twilio_response.inspect}")
  end
end
