class Intern < ActiveRecord::Base
  
  has_one :account, :as => :logable
end