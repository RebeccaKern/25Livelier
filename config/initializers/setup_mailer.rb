  ActionMailer::Base.smtp_settings = {  
    :address              => "smtp.mail.yahoo.com",       
    :port                 => 587,                         
    :user_name            => ENV["TEMP_email"],  # ENV['YAHOO_ADDR']
    :password             => ENV["TEMP_PWD"],       # ENV['YAHOO_PWD']
    :authentication       => "plain",  
    :enable_starttls_auto => true  
  }
