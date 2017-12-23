class ApplicationMailer < ActionMailer::Base
  default from: 'no-reply@timeblock.herokuapp.com'
  layout 'mailer'
end
