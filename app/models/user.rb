class User < ActiveRecord::Base

has_secure_password
validates_presence_of :password, :on => :create
validates :email, :country, :city, :presence => true
end
