class EventMailer < ApplicationMailer
  def create_event_email(event)
    @event = event
    self.mail(to: Figaro.env.event_send_email, subject: "[SPECIAL EVENT] #{@event.title}")
  end
end
