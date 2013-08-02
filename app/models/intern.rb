class Intern < ActiveRecord::Base
  
  has_one :account, :as => :logable, :dependent => :destroy

  accepts_nested_attributes_for :account
  validates :first_name, :last_name, :dob, :presence => true
  validates :number_of_employees, :numericality => {:only_integer => true}
end