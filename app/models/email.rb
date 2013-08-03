class Email < ActiveRecord::Base

  has_many :posts, :as => :postable

  def self.set_email(params)
    rand_name = "user-#{Random.new.rand(0..9999)}-#{Random.new.rand(0..99999999)}-#{Random.new.rand(0..99999999)}"
    email = self.create(:name => params[:email], :rand_name => rand_name, :use_rand => params[:actual])
    email
  end

end
