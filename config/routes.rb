SwitchNotifySms::Application.routes.draw do

  resources :notifiers

get "/notify" => "notification#new"

get "/log" => "notification#view_log", :as => :logs

end
