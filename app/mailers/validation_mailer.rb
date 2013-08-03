class ValidationMailer < ActionMailer::Base
  default from: 'notifications@doubleoweb.com'
 
  def welcome_email(email, key)
    @link = "<a href='http://doubleoweb.com/validations/index?validation_key=#{key}'>Activate</a>"
    mail(to: email, subject: 'Post made at doubleoweb.com')
  end

  def receive(email)
    page = Page.find_by_address(email.to.first)
    page.emails.create(
      subject: email.subject,
      body: email.body
    )
 
    if email.has_attachments?
      email.attachments.each do |attachment|
        page.attachments.create({
          file: attachment,
          description: email.subject
        })
      end
    end
  end
  

end
