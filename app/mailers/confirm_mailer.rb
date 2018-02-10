class ConfirmMailer < ApplicationMailer
  def new_event_msg(event)
    @event = event
    mail(:to => "jstapins@andrew.cmu.edu", :subject => "Event Confirmation")
  end
end
