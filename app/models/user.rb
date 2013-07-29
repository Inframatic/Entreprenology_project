class User < ActiveRecord::Base

validates :email, :country, :city, :presence => true
end
