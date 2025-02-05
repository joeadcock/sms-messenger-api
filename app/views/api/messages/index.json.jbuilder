json.array! @messages do |message|
  json.extract! message, :message, :phone, :status
  json.sentAt message.sent_at.to_s
end
