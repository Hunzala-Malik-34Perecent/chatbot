# frozen_string_literal: true

class MessagesController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @chat_interface = ChatInterface.find(params[:chat_interface_id])
    @message = @chat_interface.messages.build(message_params)
    @message.role = 'user'

    if @message.save!
      OpenAiJob.perform_async(@chat_interface.id)
      respond_to(&:turbo_stream)
    else
      render json: { errors: @message.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def message_params
    params.require(:message).permit(:content)
  end
end
