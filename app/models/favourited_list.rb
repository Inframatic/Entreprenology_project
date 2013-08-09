class FavouritedList < ActiveRecord::Base
  belongs_to :favouritable, polymorphic: true, :dependent => :destroy
  
end
