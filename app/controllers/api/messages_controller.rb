module Api
  class MessagesController < ApplicationController
    before_action :authenticate_user!

    # GET /messages
    def index
      @messages = current_user.messages.all.order(created_at: :desc)

      # render json: @messages
    end

    # POST /messages
    def create
      @message = current_user.messages.new(message_params)

      if @message.save
        SendMessageJob.perform_later(@message)

        render json: @message, status: :created
      else
        render json: @message.errors, status: :unprocessable_entity
      end
    end

    private

    def message_params
      params.expect(message: [ :message, :phone, :sent_at ])
    end
  end
end
