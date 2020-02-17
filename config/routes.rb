Rails.application.routes.draw do
  get '/', to: 'games#new'
  Rails.application.config.session_store :cookie_store, key: 0
  post '/score', to: 'games#score'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
