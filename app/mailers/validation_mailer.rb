class ValidationMailer < ActionMailer::Base
  default from: 'notifications@doubleoweb.com'
 
  def welcome_email(email, key)
    @link = "<a href='http://doubleoweb.com/validations/index?validation_key=#{key}'>Activate</a>"
    mail(to: email, subject: 'Post made at doubleoweb.com')
  end
  

end
