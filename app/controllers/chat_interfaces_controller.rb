class ChatInterfacesController < ApplicationController
  before_action :set_chat_interface, only: %i[ show edit update destroy ]

  def index
    @chat_interfaces = ChatInterface.all
  end

  def show
  end

  def new
    @chat_interface = ChatInterface.new
  end

  def edit
  end

  def create
    @chat_interface = ChatInterface.new(chat_interface_params)

    respond_to do |format|
      if @chat_interface.save
        format.html { redirect_to chat_interface_url(@chat_interface), notice: "Chat interface was successfully created." }
        format.json { render :show, status: :created, location: @chat_interface }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @chat_interface.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @chat_interface.update(chat_interface_params)
        format.html { redirect_to chat_interface_url(@chat_interface), notice: "Chat interface was successfully updated." }
        format.json { render :show, status: :ok, location: @chat_interface }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @chat_interface.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @chat_interface.destroy

    respond_to do |format|
      format.html { redirect_to chat_interfaces_url, notice: "Chat interface was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    def set_chat_interface
      @chat_interface = ChatInterface.find(params[:id])
    end

    def chat_interface_params
      params.require(:chat_interface).permit(:user_id)
    end
end
