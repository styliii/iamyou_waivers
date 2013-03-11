ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "li.ouyang",
  :password             => "louyan01",
  :authentication       => "plain",
  :enable_starttls_auto => true
}
