class Intern < ActiveRecord::Base
  
  has_one :account, :as => :logable

  accepts_nested_attributes_for :account
  validates :first_name, :last_name, :dob, :presence => true
end