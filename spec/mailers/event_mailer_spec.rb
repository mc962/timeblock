require "rails_helper"

RSpec.describe EventMailer, type: :mailer do
  describe "create_event_email" do
    let(:event) { FactoryBot.build(:event) }
    let(:mail) { EventMailer.create_event_email(event) }

    it 'renders the headers' do
      expect(mail.subject).to eq("[SPECIAL EVENT] #{event.title}")
      expect(mail.to).to eq(["#{Figaro.env.event_send_email}"])
      expect(mail.from).to eq(['no-reply@google.com'])
    end

    it 'renders the body' do
      expect(mail.body.encoded).to include(event.description)
    end
  end
end
