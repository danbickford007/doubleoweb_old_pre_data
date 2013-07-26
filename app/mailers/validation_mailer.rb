class ValidationMailer < ActionMailer::Base
  default from: 'notifications@doubleoweb.com'
 
  def welcome_email(email, key)
    @link = "http://doubleoweb.com?validation_key=#{key}"
    mail(to: email, subject: 'Post made at doubleoweb.com')
  end
  

end
