class Account < ActiveRecord::Base

  belongs_to :logable, polymorphic: true
  has_secure_password
  validates_presence_of :password, :on => :create
end
