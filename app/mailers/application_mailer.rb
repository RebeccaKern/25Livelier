class ApplicationMailer < ActionMailer::Base
  default from: ENV["TEMP_EMAIL"]
  layout 'mailer'
end
