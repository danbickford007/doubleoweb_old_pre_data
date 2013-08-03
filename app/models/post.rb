class Post < ActiveRecord::Base

  belongs_to :postable, :polymorphic => true

  searchable do
    text :text_title
  end 

  def generate_post(title, email, params)
    email = Email.set_email(params)
    params[:post].merge!(:text_title => title)
    params[:post].merge!(:validation_key => key)
    params[:post].reject!{|k, v| k == "country_id"}
    params[:post].reject!{|k, v| k == "state_id"}
    send_email(email.name, key)
    params[:post].permit!
    email.posts.create(params[:post])
  end

  def send_email(email, validation_key)
    Thread.new do
      ValidationMailer.welcome_email(email, validation_key).deliver
    end
  end

  def key
    "#{Random.new.rand(0..9999)}-#{Random.new.rand(500..999999)}-#{Random.new.rand(0..9999999)}"
  end

end
