class Message < ApplicationRecord
  belongs_to :user

  validates :message, presence: true
  validates :phone, presence: true
end
