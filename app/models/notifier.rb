class Notifier < ActiveRecord::Base
  attr_accessible :device_id, :twilio_id
  
  validates :device_id,  :presence => true
  validates :twilio_id,  :presence => true
    
  has_many :logs, :dependent => :delete_all 
end
