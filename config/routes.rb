SwitchNotifySms::Application.routes.draw do

  resources :notifiers
  
  root :to => "notifiers#new"

get "/notify" => "notification#new"

get "/log" => "notification#view_log", :as => :logs

end
