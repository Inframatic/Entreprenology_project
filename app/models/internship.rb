class Internship < ActiveRecord::Base

<<<<<<< HEAD
  belongs_to :startup
=======
  belongs_to :startup, :dependent => :destroy
>>>>>>> making_rails_api
  has_one :internship_contact

  validates :start_date, :end_date, :position_description, :presence => true
end