class Post < ActiveRecord::Base

  searchable do
    text :text_title
  end 

  def generate_post(title, email)
    text_title = title
    send_email(key)
    self
  end

  def send_email(validation_key)
    Thread.new do
      ValidationMailer.welcome_email('danbickford007@yahoo.com', validation_key).deliver
    end
  end

  def key
    "#{Random.new.rand(0..9999)}-#{Random.new.rand(500.999999)}"
  end

end
