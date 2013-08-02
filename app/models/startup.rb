class Startup < ActiveRecord::Base

  has_one :account, :as => :logable, :dependent => :destroy
  has_many :internships
  
  accepts_nested_attributes_for :account
  validates :company_name, :presence => true
  validates :number_of_employees, :numericality => {:only_integer => true}
end