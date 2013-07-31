class Intern < ActiveRecord::Base

  has_one :account, :as => :logable
  has_secure_password
  validates_presence_of :password, :on => :create
end