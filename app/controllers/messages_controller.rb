class MessagesController < ApplicationController
  include ActionView::RecordIdentifier

  def create
    @message = Message.create!(message_params.merge(user_type: 'user', chat_interface_id: params[:chat_interface_id]))
    OpenAiJob.perform_async(@message.chat_interface_id)
    respond_to(&:turbo_stream)
  end

  private

    def message_params
      params.require(:message).permit(:chat_interfaces_id, :content)
    end
end
