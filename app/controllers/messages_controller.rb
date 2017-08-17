class MessagesController < ApplicationController
  before_action :require_login

  def new
    @message = Message.new
  end

  def index
    redirect_to inbox_messages_path
  end

  def inbox
    @messages = current_user.received_messages
  end

  def sent
    @messages = current_user.sent_messages
  end

  def create
    @message = current_user.sent_messages.build message_params
     if @message.save
      redirect_to sent_messages_path, flash: {success: "Message Sent."}
    else
      render "new"
    end
  end  

  private
  def message_params
    params.require(:message).permit(:recipient_id, :body)
  end
end
