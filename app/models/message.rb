class Message < ApplicationRecord
  belongs_to :user

  after_create :set_sent_at

  private

  # Internal: assign sent_at for now, eventually this could be set by Twilio API
  def set_sent_at
    update sent_at: created_at
  end
end
