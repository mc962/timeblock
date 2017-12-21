class EventMailerPreview < ActionMailer::Preview
  def create_event_email
    @event = Event.first
    EventMailer.create_event_email(@event)
  end
end
