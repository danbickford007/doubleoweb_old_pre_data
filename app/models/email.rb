class Email < ActiveRecord::Base

  has_many :posts, :as => :postable

  def self.set_email(params)
    if params[:actual]
      e = params[:email] 
    else
      e = "user-#{Random.new.rand(0..9999)}-#{Random.new.rand(0..99999999)}-#{Random.new.rand(0..99999999)}"
    end
    self.find_or_create_by_name(e)
  end

end
