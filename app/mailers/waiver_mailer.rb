class WaiverMailer < ActionMailer::Base
  add_template_helper(WaiversHelper)
  def waiver_confirmation(waiver)
    @waiver = waiver
    attachments["signature.png"] = File.read("#{Rails.root}/app/assets/images/signature.png")
    mail(:to => "waivers@iamyoustudio.com",
            :subject => "#{Time.now.strftime('%m/%d/%y')} #{waiver.full_name} has signed a waiver",
            :from => "li.ouyang@gmail.com")
  end
end
