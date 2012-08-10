class NotificationController < ApplicationController

require 'rest_client'


def new
  
  notifiers = Notifier.find_all_by_twilio_id(params[:AccountSid])
  
  urls = []
  
  if notifiers.any?
  
  notifiers.each do |device|
     send_notification(device)
  
     log = Log.new
     
     log.notifier_id = device.id
     
     log.to = params[:To]
     log.from = params[:From]
     log.from_country = params[:FromCountry]
     log.from_city = params[:FromCity]
     log.from_state = params[:FromState]
     log.message = params[:Body]
     log.notify_result = @result
     log.save
http://www.switchdevices.com/#hero     
     urls <<  'http://swtch.co/device/'+device.device_id+'/pulse'
     
  end
    render :text => urls
  else  
    render :text => '<?xml version="1.0" encoding="UTF-8" ?>   
    <Response>
        <Sms>no device defined for alerts.</Sms> 
    </Response>'
  end
end

def send_notification(device)

RestClient.get('http://swtch.co/device/'+device.device_id+'/pulse') do |response|
  if response.code == 200
    @result = "Success"
  else 
    @result = "failed with #{response.code}"
  end
end

end

def view_log
  @logs = Log.all(:order => "created_at DESC")
  
end

end
