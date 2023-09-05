class ChatInterfacesController < ApplicationController
  before_action :set_chat_interface, only: %i[ show ]

  def index
    @chat_interfaces = ChatInterface.order(created_at: :desc)
  end

  def show
    @chat_interface
  end

  def create
    @chat_interface = current_user.chat_interfaces.create!

    redirect_to root_path
  end

  private
    def set_chat_interface
      @chat_interface = ChatInterface.find(params[:id])
    end

    def chat_interface_params
      params.require(:chat_interface).permit(:user_id)
    end
end
