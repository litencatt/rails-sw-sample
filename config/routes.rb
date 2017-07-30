Rails.application.routes.draw do
  root 'home#index'
  post '/devices', to: 'devices#create'
end
