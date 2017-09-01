class AnnouncementChannel < ApplicationCable::Channel
  def subscribed
    stream_from "announcements"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
