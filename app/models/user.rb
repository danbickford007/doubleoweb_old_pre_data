class User < ActiveRecord::Base

  def self.current=(user)
    Thread.current[:user] = user
  end

  def self.current
    Thread.current[:user] 
  end

end
