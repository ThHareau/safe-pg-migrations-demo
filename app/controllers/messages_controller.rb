class MessagesController < ApplicationController
  before_action :set_message, only: %i[ destroy ]

  # GET /messages
  def index
    @messages = Message.order(created_at: :desc).all
    @message = Message.new
    @message.author = Author.new
  end

  # POST /messages
  def create
    @message = Message.new(message_params)

    if @message.save
      redirect_to messages_url, notice: "Message was successfully created."
    else
      render :index, status: :unprocessable_entity
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def message_params
    params.require(:message).permit(:text, author_attributes: %i[name])
  end
end
