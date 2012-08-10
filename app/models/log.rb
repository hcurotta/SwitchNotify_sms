class Log < ActiveRecord::Base
  attr_accessible :from, :from_city, :from_country, :from_state, :message, :notify_result, :to
  
  belongs_to :notifier 
  
end
