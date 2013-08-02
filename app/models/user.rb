class User < ActiveRecord::Base

  has_many :posts, :as => :postable

  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.current
    Thread.current[:user] 
  end

end
