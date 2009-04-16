class User < ActiveRecord::Base
  validates_uniqueness_of :name
  validates_presence_of :name, :password
  validates_confirmation_of :password
  
  has_many :stats
end
