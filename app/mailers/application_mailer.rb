class ApplicationMailer < ActionMailer::Base
  default from: ENV["TEMP_email"]
  layout 'mailer'
end
