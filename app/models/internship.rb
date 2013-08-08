class Internship < ActiveRecord::Base
  belongs_to :startup, :dependent => :destroy
  has_one :internship_contact

  validates :start_date, :end_date, :position_description, :presence => true
end