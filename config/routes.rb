Rails.application.routes.draw do
  resources :musics
  get "/", to: 'index#index'
  mount ActionCable.server => '/cable'
end
