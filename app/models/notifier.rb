class Notifier < ActiveRecord::Base
  attr_accessible :device_id, :twilio_id
  
  has_many :logs
end
