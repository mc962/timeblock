class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@google.com'
  layout 'mailer'
end
